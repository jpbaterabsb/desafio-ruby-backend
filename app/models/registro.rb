require_relative '../files/leitor.rb'
require_relative '../files/padroes/cnab.rb'

class Registro < ApplicationRecord
    include ValidationHelper

    belongs_to :tipo_transacao
    belongs_to :loja
    attr_reader :erros

    def criar_registro_pelo_arquivo(file)
        leitor = Leitor.new file
        resposta = leitor.extrair(Cnab)
        @erros = resposta[0]
        registros_validos = []
        resposta[1].each do |registro|
            error = @erros.length
            db_tipo_transacao = tipo_transacao_by_registro(registro)
            valid_registro  registro
            if error == @erros.length
                valor = registro.valor.to_i/100 * (db_tipo_transacao.natureza == 0 ? 1 : -1)
                loja = find_loja(registro)
                registros_validos << { 
                tipo_transacao_id: registro.tipo,
                loja_id: loja.id,
                data: Time.zone.strptime("#{registro.data}#{registro.hora}", "%Y%m%d%H%M%S"), 
                valor: valor, 
                cartao: registro.cartao,
                CPF: registro.CPF
            }
            end
        end
        Registro.create(registros_validos)
    end


    private

    def tipo_transacao_by_registro(registro)  
        TipoTransacao.find(registro.tipo)
    rescue
        @erros << "linha #{registro.line_number} o tipo transação inválido :: #{registro.tipo}"        
        nil?
    end

    def find_loja (registro)
        Loja.create_with(proprietario: registro.dono_da_loja.strip.capitalize).find_or_create_by(nome: registro.nome_loja.strip.capitalize)
    end

    def valid_registro(registro)
        assert_true valid_date?(registro.data), "linha #{registro.line_number} data inválida  :: #{registro.data}"        
        assert_true valid_number?(registro.valor), "linha #{registro.line_number} o valor #{registro.valor} deve ser do tipo numérico"        
        assert_true check_cpf(registro.CPF), "linha #{registro.line_number} o CPF #{registro.CPF} é invalido"        
        assert_not_blank(registro.cartao, "linha #{registro.line_number} o cartao nao deve ser nulo")
        assert_true valid_time?(registro.hora), "linha #{registro.line_number} hora inválida :: #{registro.hora}" 
        assert_true valid_name?(registro.dono_da_loja), "linha #{registro.line_number} nome do dono da loja é invalido :: #{registro.dono_da_loja}" 
        assert_not_blank(registro.nome_loja, "linha #{registro.line_number} nome da loja não pode ser nulo") 
    end    

end
