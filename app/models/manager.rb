# -*- encoding : utf-8 -*-
class Manager < ActiveRecord::Base
	belongs_to :main
  attr_accessible :email, :phone, :pib, :position, :supermanager
  attr_accessor :supermanager
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => ": неправильный формат email"
  validates_presence_of :pib, :message => ": Поле ФИО должно быть заполнено"
  validates_presence_of :phone, :message => ": Поле Телефон должно быть заполнено"
  validates_presence_of :position, :message => ": Поле Должность должно быть заполнено"
end
