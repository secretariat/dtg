# -*- encoding : utf-8 -*-
class Product < ActiveRecord::Base
	belongs_to :zayavka
  attr_accessible :codyktved,
  								:dopinfo, 
  								:factstoim, 
  								:kolvo, 
  								:naim, 
  								:nomenkl, 
  								:zayavka_id, 
  								:pos_stavka, 
  								:pos_summa, 
  								:nalog_stavka, 
  								:nalog_summa, 
  								:neft_stavka, 
  								:neft_summa, 
  								:nds_stavka, 
  								:nds_summa, 
  								:vsego, 
  								:opis_all, 
                  :edizm,
                  :currency,
                  :factstoim_all
end
