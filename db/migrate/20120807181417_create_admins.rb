# -*- encoding : utf-8 -*-
class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :main_id
      t.string :email

      t.timestamps
    end
  end
end
