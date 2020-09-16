# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_16_183109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lojas", force: :cascade do |t|
    t.string "nome"
    t.string "proprietario"
    t.index ["nome"], name: "index_lojas_on_nome", unique: true
  end

  create_table "registros", force: :cascade do |t|
    t.datetime "data"
    t.float "valor"
    t.string "CPF"
    t.string "cartao"
    t.bigint "tipo_transacao_id"
    t.bigint "loja_id"
    t.index ["loja_id"], name: "index_registros_on_loja_id"
    t.index ["tipo_transacao_id"], name: "index_registros_on_tipo_transacao_id"
  end

  create_table "tipo_transacaos", force: :cascade do |t|
    t.string "descricao"
    t.integer "natureza"
  end

  add_foreign_key "registros", "lojas"
  add_foreign_key "registros", "tipo_transacaos"
end
