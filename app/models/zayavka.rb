# -*- encoding : utf-8 -*-

class Zayavka < ActiveRecord::Base

	self.per_page = 15
  belongs_to :user
  has_many :products

  # validates_presence_of :field_3_1, :message => "Поле ФИО не может быть пустым"

  amoeba do
    enable
  end

  accepts_nested_attributes_for :products, :reject_if => lambda { |a| a[:naim].blank? }, :allow_destroy => true
  attr_protected

  def self.get_status( status )

		case status
			when 1 then str = "<span class=\"label\">Сохранена</span>".html_safe
			when 2 then str = "<span class=\"label label-info\">Отправлена</span>".html_safe
			when 3 then str = "<span class=\"label label-important\">Принята</span>".html_safe
			when 4 then str = "<span class=\"label label-success\">Готова</span>".html_safe
			when 5 then str = "<span class=\"label label-warning\">Аннулирована</span>".html_safe
			else str = "<span class=\"label label-warning\">Статус неизвестен</span>".html_safe
		end

		return str
	end


end
