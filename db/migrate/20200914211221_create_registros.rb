class CreateRegistros < ActiveRecord::Migration[6.0]
  def change
    create_table :registros do |t|
      t.datetime :data
      t.float :valor
      t.string :CPF
      t.string :cartao
    end
  end
end
