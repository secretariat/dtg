class Main < ActiveRecord::Base
  has_one :admin
  has_one :manager
  has_one :user
  attr_accessible :login, :hash_pass, :hash_salt, :owner_id, :priv_level
end
