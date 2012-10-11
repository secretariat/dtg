class CreateZayavkas < ActiveRecord::Migration
  def change
    create_table :zayavkas do |t|
      t.integer :user_id
    	t.integer :usercount
      t.string :tamrez
    	t.string :typetran
      t.integer :garantee
      t.integer :status
      #1. Отправитель товара
      t.string :field_1_1
      t.string :field_1_2
      t.string :field_1_3
      #3. Избранный маршрут транзитного перемещения
      t.string :field_3_1
      t.string :field_3_2
      t.string :field_3_3
      t.string :field_3_4
      #4. Получатель товара
      t.string :field_4_1
      t.string :field_4_2
      t.string :field_4_3
      #5. Субъект ВЭД, заключивший внешнеэкономический договор
      t.string :field_5_1
      t.string :field_5_2
      t.string :field_5_2
      t.string :field_5_3
      t.string :field_5_4
      t.string :field_5_5
      t.string :field_5_6
      t.string :field_5_7
      #7. Экспедиторская организация
      t.string :field_7_1 
      t.string :field_7_2 
      t.string :field_7_3 
      t.string :field_7_4 
      #8. Информация о перевозчике и транспортном средстве
      t.string :field_8_1 
      t.string :field_8_2
      t.string :field_8_3
      t.string :field_8_4_1
      t.string :field_8_4_2
      t.string :field_8_5
      t.string :field_8_6
      t.string :field_8_7
      #9. Дополнительная информация
      t.string :field_9 #dop info

      t.timestamps
    end
    add_index("zayavkas", "user_id")
  end
end
