require_relative './padroes/cnab.rb'

class Leitor
  def initialize(endereco_arquivo)
    @endereco_arquivo = endereco_arquivo
  end

  def extrair(template)
    errors = []
    registros = []
    arquivo = File.open(@endereco_arquivo)
    arquivo.readlines.each_with_index do |line, index|
      i = index+1;
      unless line.length == template.tamanho
        errors << "linha #{i} com tamanho invalido. tamanho esperado: #{template.tamanho}, tamanho recebido: #{line.length}"
      else
        registros << template.new(line, i)
      end
    end
    return [errors, registros]
  end
end
