class AddDogovorToZayavkas < ActiveRecord::Migration
  def change
    add_column :zayavkas, :dogovor, :string
  end
end
