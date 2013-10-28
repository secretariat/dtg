class Dogovor < ActiveRecord::Base
	belongs_to :user
  attr_accessible :dognum, :dogdate
end
