class CreateTipoTransacaos < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_transacaos do |t|
      t.string :descricao
      t.integer :natureza
    end
  end
end
