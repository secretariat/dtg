# -*- encoding : utf-8 -*-
class CreateTransports < ActiveRecord::Migration
  def change
    create_table :transports do |t|
      t.string :name

      t.timestamps
    end
  end
end
