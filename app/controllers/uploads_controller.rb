class UploadsController < ApplicationController
  skip_before_action :verify_authenticity_token
  attr_accessor :file, :registros, :erros

  def create
    registro = Registro.new
    registros = registro.criar_registro_pelo_arquivo(params[:file])
    erros = registro.erros
    render json: {erros: erros}
  end
end