# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  belongs_to :main
  attr_accessible :chef, :cname, :dognum, :edrpo, :email, :gdcode, :phone, :pib, :uaddr
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => ": непрваильный формат email"
  validates_presence_of :pib, :message => ": Поле ФИО должно быть заполнено"
  validates_presence_of :cname, :message => ": Поле Название компании должно быть заполнено"
  validates_presence_of :dognum, :message => ": Поле Номер договора должно быть заполнено"
  validates_presence_of :gdcode, :message => ": Поле Код ГД должно быть заполнено"
  validates_presence_of :phone, :message => ": Поле Телефон должно быть заполнено"
  validates_presence_of :chef, :message => ": Поле Руководитель должно быть заполнено"
  validates_presence_of :edrpo, :message => ": Поле Код ЕДРПО должно быть заполнено"
end
	