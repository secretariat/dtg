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
			when 1 then str = "<span class=\"label\">Отправлена</span>".html_safe
			when 2 then str = "<span class=\"label label-info\">Принята</span>".html_safe
			when 3 then str = "<span class=\"label label-success\">Готова</span>".html_safe
			when 4 then str = "<span class=\"label label-important\">Аннулирована</span>".html_safe 
			else str = "<span class=\"label label-inverse\">Статус неизвестен</span>".html_safe
		end

		return str
	end


end
