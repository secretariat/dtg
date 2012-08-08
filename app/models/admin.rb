class Admin < ActiveRecord::Base
  belongs_to :main
  attr_accessible :email
end
