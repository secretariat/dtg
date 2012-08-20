class CreateZayavkas < ActiveRecord::Migration
  def change
    create_table :zayavkas do |t|
    	t.integer :user_id
      t.string :tamrez
    	t.string :typetran
    	t.string :cname
    	t.integer :garantee
    	
      t.timestamps
    end
    add_index("zayavkas", "user_id")
  end
end
