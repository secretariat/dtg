class Zayavka < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
end
