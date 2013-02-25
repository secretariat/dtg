class AddTempPeriodColumnToZayavkas < ActiveRecord::Migration
  def change
    add_column :zayavkas, :temp_period, :string
  end
end
