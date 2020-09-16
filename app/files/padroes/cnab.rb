class Cnab 
  attr_reader :tipo, :data, :valor, :CPF, :cartao, :hora, :dono_da_loja, :nome_loja, :line_number
  def initialize(line, index)
    @tipo =  line[0, 1]
    @data = line[1, 8]
    @valor = line[9, 10]
    @CPF = line[19, 11]
    @cartao = line[30, 12]
    @hora = line[42, 6]
    @dono_da_loja = line[48, 14]
    @nome_loja = line[62, 19] 
    @line_number = index
  end

  def self.tamanho
    81
  end
end