class AddLojaToRegistro < ActiveRecord::Migration[6.0]
  def change
    add_reference :registros, :loja, null: true, foreign_key: true
  end
end
