class CreateEdizms < ActiveRecord::Migration
  def change
    create_table :edizms do |t|
      t.string :name

      t.timestamps
    end
  end
end
