class LojasController < ApplicationController
    skip_before_action :verify_authenticity_token
    def show    
      @lojas = Loja.joins(:registros)
      .select("lojas.*, SUM(registros.valor) as saldo")
      .group(:id, :nome, :proprietario)
      .order(:id)
      render json: @lojas
    end

    def registros()
        @loja = Loja.joins(:registros).find(params[:id])
        render json: @loja.to_json(include: { registros: {
            include: :tipo_transacao
        }})
    end
end
