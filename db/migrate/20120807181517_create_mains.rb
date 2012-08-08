class CreateMains < ActiveRecord::Migration
  def change
    create_table :mains do |t|
    	t.string :login, :limit => 20
    	t.string :hash_pass, :limit => 100
    	t.string :hash_salt, :limit => 100
    	t.integer :owner_id 
    	t.integer :priv_level
      t.timestamps
    end
  end
end
