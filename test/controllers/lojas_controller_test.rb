require 'test_helper'

class LojasControllerTest < ActionDispatch::IntegrationTest
  test "listar loja com seus respectivos gastos" do
    create_loja
    get '/lojas'
    resposta = JSON.parse(@response.body);
    assert resposta[0]["nome"] == @loja.nome
    assert resposta[0]["proprietario"].eql? @loja.proprietario
    assert resposta[0]["saldo"] == @valor
  end

  test "listar registros de sua respectiva loja" do
    criar_registros_para_uma_loja
    get "/lojas/#{@loja.id}/registros"
    resposta = JSON.parse(@response.body);
    resposta["nome"] == @loja.nome
    resposta["id"] == @loja.id
    resposta["registros"][0]["id"] == @registro.id
    resposta["registros"][0]["tipo_transacao_id"] == 1
  end

  private 

  def create_loja
    @loja = Loja.new
    @loja.nome = 'Unbox'
    @loja.proprietario = 'Bruno Moraes'
    @loja.save!
    
    @valor = 24.00
    registro = Registro.new
    registro.loja_id = @loja.id
    registro.tipo_transacao_id = 1
    registro.CPF =  '08976514311'
    registro.valor = @valor
    registro.data = Time.zone.now
    registro.cartao ='5436****1234'
    registro.save!
  end
  

  def criar_registros_para_uma_loja
    @loja = Loja.new
    @loja.nome = 'Unbox'
    @loja.proprietario = 'Bruno Moraes'
    @loja.save!
    
    @valor = 24.00
    @registro = Registro.new
    @registro.loja_id = @loja.id
    @registro.tipo_transacao_id = 1
    @registro.CPF =  '08976514311'
    @registro.valor = @valor
    @registro.data = Time.zone.now
    @registro.cartao ='5436****1234'
    @registro.save!

    registro2 = Registro.new
    registro2.loja_id = 1
    registro2.tipo_transacao_id = 1
    registro2.CPF =  '08976514322'
    registro2.valor = @valor
    registro2.data = Time.zone.now
    registro2.cartao ='5436****1222'
    registro2.save!
  end
end
