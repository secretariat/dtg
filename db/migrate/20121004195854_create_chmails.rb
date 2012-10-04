class CreateChmails < ActiveRecord::Migration
  def change
    create_table :chmails do |t|
      t.string :email

      t.timestamps
    end
  end
end
