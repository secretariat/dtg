class AddOwnCommentsColumnToZayavkas < ActiveRecord::Migration
  def change
    add_column :zayavkas, :own_comments, :text
  end
end
