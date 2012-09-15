class CreateGarantees < ActiveRecord::Migration
  def change
    create_table :garantees do |t|
      t.string :name

      t.timestamps
    end
  end
end
