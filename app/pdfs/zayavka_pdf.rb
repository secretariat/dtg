# -*- encoding : utf-8 -*-
class ZayavkaPdf < Prawn::Document
  def initialize(zayavka)
    super(top_margin: 70)
    @zayavka = zayavka
    name
  end
  
  def name
    text "Номер заявки \##{@zayavka.id}"
  end
  
end
