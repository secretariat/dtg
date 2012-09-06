# -*- encoding : utf-8 -*-

class Zayavka < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_many :products
  accepts_nested_attributes_for :products
  # attr_accessible :user_id, :tamrez, :typetran, :garantee, :field_1_1,
  #    							:field_1_2, :field_1_3
  attr_protected

  def self.get_status( status )
		
		case status 
			when 1 then str = "Отправлена"
			when 2 then str = "Принята" 
			when 3 then str = "Готова" 
			when 4 then str = "Аннулирована" 
			else str = "Статус неизвестен"
		end

		return str
	end


end
