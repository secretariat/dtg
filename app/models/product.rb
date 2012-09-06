class Product < ActiveRecord::Base
	belongs_to :zayavka
  attr_accessible :codyktved, :dopinfo, :factstoim, :kolvo, :naim, :nomenkl, :zayavka_id
end
