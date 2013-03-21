# -*- encoding : utf-8 -*-
class AddOwnCommentsColumnToZayavkas < ActiveRecord::Migration
  def change
    add_column :zayavkas, :own_comments, :text
  end
end
