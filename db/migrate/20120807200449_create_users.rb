# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :main_id
      t.string :cname
      t.string :uaddr
      t.string :phone
      t.string :chef
      t.string :email
      t.string :dognum
      t.string :edrpo
      t.string :gdcode
      t.string :pib

      t.timestamps
    end
  end
end
