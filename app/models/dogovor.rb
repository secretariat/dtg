class Dogovor < ActiveRecord::Base
	belongs_to :user
  attr_accessible :dogdate, :dogname
end
