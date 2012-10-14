# -*- encoding : utf-8 -*-
class ZayavkaPdf < Prawn::Document
  def initialize(zayavka)
    super(top_margin: 70)
    @zayavka = zayavka
    name
  end
  
  def name
    text "Zayavlenie oprosnik number \##{@zayavka.id}"
  end
  
end
