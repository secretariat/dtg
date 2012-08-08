class Manager < ActiveRecord::Base
	belongs_to :main
  attr_accessible :email, :phone, :pib, :postion
end
