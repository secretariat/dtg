class CreateZayavkas < ActiveRecord::Migration
  def change
    create_table :zayavkas do |t|
    	t.string :tamrez
    	t.string :typetran
    	t.string :cname
    	t.integer :garantee
    	
      t.timestamps
    end
  end
end