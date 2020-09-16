class AddTipoTransacaoToRegistros < ActiveRecord::Migration[6.0]
  def change
    add_reference :registros, :tipo_transacao, null: true, foreign_key: true
  end
end
