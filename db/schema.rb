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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120807200449) do

  create_table "admins", :force => true do |t|
    t.integer  "main_id"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mains", :force => true do |t|
    t.string   "login",      :limit => 20
    t.string   "hash_pass"
    t.string   "hash_salt"
    t.integer  "owner_id"
    t.integer  "priv_level"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "managers", :force => true do |t|
    t.string   "main_id"
    t.string   "pib"
    t.string   "postion"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "main_id"
    t.string   "cname"
    t.string   "uaddr"
    t.string   "phone"
    t.string   "chef"
    t.string   "email"
    t.string   "dognum"
    t.string   "edrpo"
    t.string   "gdcode"
    t.string   "pib"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
