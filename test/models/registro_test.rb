require 'test_helper'

class RegistroTest < ActiveSupport::TestCase
  test "processar arquivo CNAB.txt e nao retornar nenhum erro" do
    path = File.join(File.dirname(__FILE__), '../../storage/CNAB.txt')
    file = File.open(path)
    registro = Registro.new
    registro.criar_registro_pelo_arquivo(file)
    assert registro.erros.blank?
    assert Registro.all.length == 23 # 21 no arquivo + 2 no yaml
  end

  test "processar arquivo CNAB_BUG.txt e deve processar 1 registro e retornar 10 mensagens de erro" do
    path = File.join(File.dirname(__FILE__), '../../storage/CNAB_BUG.txt')
    file = File.open(path)
    registro = Registro.new
    registros = registro.criar_registro_pelo_arquivo(file)
    assert registro.erros.length == 10
    assert registros.length == 1
  end
end
