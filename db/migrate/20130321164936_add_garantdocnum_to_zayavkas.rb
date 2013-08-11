# -*- encoding : utf-8 -*-
class AddGarantdocnumToZayavkas < ActiveRecord::Migration
  def change
    add_column :zayavkas, :garantdocnum, :string, :default => ''
  end
end
