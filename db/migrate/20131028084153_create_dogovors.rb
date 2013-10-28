class CreateDogovors < ActiveRecord::Migration
  def change
    create_table :dogovors do |t|
    	t.integer :user_id
      t.string :dognum
      t.string :dogdate

      t.timestamps
    end
  end
end
