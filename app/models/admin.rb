# -*- encoding : utf-8 -*-
class Admin < ActiveRecord::Base
  belongs_to :main
  attr_accessible :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => ": непрваильный формат email"
end
