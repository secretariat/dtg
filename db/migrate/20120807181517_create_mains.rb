# -*- encoding : utf-8 -*-
class CreateMains < ActiveRecord::Migration
  def change
    create_table :mains do |t|
    	t.string :login, :presence => true, :limit => 20
    	t.string :hash_pass
    	t.string :hash_salt
    	t.integer :owner_id, :presence => true 
    	t.integer :priv_level, :presence => true
      t.timestamps
    end
  end
end
