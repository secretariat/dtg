class User < ActiveRecord::Base
  belongs_to :main
  attr_accessible :chef, :cname, :dognum, :edrpo, :email, :gdcode, :phone, :pib, :uaddr
end
