class CreateLojas < ActiveRecord::Migration[6.0]
  def change
    create_table :lojas do |t|
      t.string :nome, index: {unique: true}
      t.string :proprietario
    end
  end
end
