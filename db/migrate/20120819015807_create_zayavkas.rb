class CreateZayavkas < ActiveRecord::Migration
  def change
    create_table :zayavkas do |t|
      t.integer :user_id
    	t.integer :usercount
      t.string :tamrez
    	t.string :typetran
      t.integer :garantee
      t.integer :status
      t.string :field_1_1
      t.string :field_1_2
      t.string :field_1_3
      
      t.string :field_4_1
      t.string :field_4_2
      t.string :field_4_3
      t.string :field_4_4
      t.string :field_5_1
      t.string :field_5_2
      # t.string :field_5_2_2
      # t.string :field_5_2_3
      t.string :field_5_3
      t.string :field_6_1
      t.string :field_6_2
      t.string :field_6_2
      # t.string :field_6_2_3
      t.string :field_6_3
      t.string :field_6_4
      t.string :field_6_5
      t.string :field_6_6_1 #dogovor veshneek
      t.string :field_6_6_2 
      t.string :field_6_6_3 
      t.string :field_6_7_1 
      t.string :field_6_7_2 
      # t.string :field_6_7_3 
      t.string :field_7_1 
      t.string :field_7_2 
      t.string :field_7_3 
      t.string :field_8_1 #ekspeditori
      t.string :field_8_2
      # t.string :field_8_2_2
      # t.string :field_8_2_3
      t.string :field_8_3
      t.string :field_8_4
      ############################################
      t.string :field_9_1 #perevozshik
      t.string :field_9_2
      # t.string :field_9_2_2
      # t.string :field_9_2_3
      t.string :field_9_3
      t.string :field_9_4_1
      t.string :field_9_4_2
      t.string :field_9_5
            ############################################
      t.string :field_10 #dop info

      t.timestamps
    end
    add_index("zayavkas", "user_id")
  end
end
