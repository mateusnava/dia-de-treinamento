# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150730000215) do

  create_table "administradores", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "administradores", ["email"], name: "index_administradores_on_email", unique: true, using: :btree
  add_index "administradores", ["reset_password_token"], name: "index_administradores_on_reset_password_token", unique: true, using: :btree

  create_table "eventos", force: true do |t|
    t.string   "nome"
    t.integer  "vagas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inscricoes", force: true do |t|
    t.integer  "pessoa_id"
    t.integer  "evento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "participou", default: false, null: false
  end

  add_index "inscricoes", ["evento_id"], name: "index_inscricoes_on_evento_id", using: :btree
  add_index "inscricoes", ["pessoa_id"], name: "index_inscricoes_on_pessoa_id", using: :btree

  create_table "pessoas", force: true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "empresa"
    t.string   "instituicao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
