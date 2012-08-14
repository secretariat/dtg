class Admin < ActiveRecord::Base
  belongs_to :main
  attr_accessible :email

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  validates :email, :format => EMAIL_REGEX

end