class AddZayavkaFillerPersonFieldsToZayavka < ActiveRecord::Migration
  def change
    add_column :zayavkas, :field_10_1, :string
    add_column :zayavkas, :field_10_2, :string
    add_column :zayavkas, :field_10_3, :string
  end
end
