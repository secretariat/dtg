class Admin < ActiveRecord::Base
  belongs_to :main
  attr_accessible :email
  
  # validates :email, :presence => true, :format => EMAIL_REGEX


  # EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
end