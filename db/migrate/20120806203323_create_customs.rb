# -*- encoding : utf-8 -*-
class CreateCustoms < ActiveRecord::Migration
  def change
    create_table :customs do |t|
      t.string :name

      t.timestamps
    end
  end
end
