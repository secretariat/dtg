# -*- encoding : utf-8 -*-

class Zayavka < ActiveRecord::Base

	self.per_page = 15
  belongs_to :user
  has_many :products

  validates_presence_of :field_3_1, :message => "п. 3.1 не может быть пустым"
  validates_presence_of :field_3_2, :message => "п. 3.2 не может быть пустым"
  validates_presence_of :field_3_3, :message => "п. 3.3 не может быть пустым"
  validates_presence_of :field_3_4, :message => "п. 3.4 не может быть пустым"
  # validates_presence_of :field_8_4_1, :message => "п. 8.4.1 не может быть пустым"
  # validates_presence_of :field_8_4_2, :message => "п. 8.4.2 не может быть пустым"
  # validates_presence_of :field_8_5, :message => "п. 8.5 не может быть пустым"
  validates_presence_of :field_10_1, :message => "п. 10.1 не может быть пустым"
  validates_presence_of :field_10_2, :message => "п. 10.2 не может быть пустым"
  validates_presence_of :field_10_3, :message => "п. 10.3 не может быть пустым"

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
