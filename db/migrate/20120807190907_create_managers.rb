# -*- encoding : utf-8 -*-
class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
    	t.string :main_id
      t.string :pib
      t.string :postion
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
