class AddFactBillDateToZayavkas < ActiveRecord::Migration
  def change
    add_column :zayavkas, :field_5_7_1, :string
  end
end
