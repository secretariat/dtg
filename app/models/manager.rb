class Manager < ActiveRecord::Base
	belongs_to :main
  attr_accessible :email, :phone, :pib, :postion
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => ": incorrect format, check your email field"
end
