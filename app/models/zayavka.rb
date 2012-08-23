class Zayavka < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  # attr_accessible :user_id, :tamrez, :typetran, :garantee, :field_1_1,
  #    							:field_1_2, :field_1_3
  attr_protected
end
