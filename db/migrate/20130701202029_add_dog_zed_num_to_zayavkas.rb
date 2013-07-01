class AddDogZedNumToZayavkas < ActiveRecord::Migration
  def change
    add_column :zayavkas, :field_5_6_1, :string
  end
end
