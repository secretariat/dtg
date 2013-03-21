# -*- encoding : utf-8 -*-
class AddGarantsummaToZayavkas < ActiveRecord::Migration
  def change
    add_column :zayavkas, :garantsumma, :string, :default => ''
  end
end
