# -*- encoding : utf-8 -*-
class ZayavkaPdf < Prawn::Document
  def initialize(zayavka, user)

    super(top_margin: 70)
    @zayavka = zayavka
    @user = user
    show
  end
  
  def show
  	  font_families.update(
      "Verdana" => {
        :bold => "prawn_fonts/verdanab.ttf",
        :italic => "prawn_fonts/verdanai.ttf",
        :normal  => "prawn_fonts/verdana.ttf" })
    font "Verdana", :size => 10
    
    text "Завление опросник № #{@zayavka.id}     к Договору № #{@user.dognum}     от #{@user.updated_at} г.", :align => :center, :style => :bold
    text "Таможенный режим: #{@zayavka.tamrez}     Тип гарантии: #{@zayavka.garantee}"
    text "1. Отправитель товара", :align => :center, :style => :bold
    text "1.1 Наименование фирмы: #{@zayavka.field_1_1}"
    text "1.2 Юридический адрес, телефон, email: #{@zayavka.field_1_1}"
    text "1.3 Руководитель, ФИО: #{@zayavka.field_1_3}"
    text "2. Информация о товаре", :align => :center, :style => :bold
  end
  
end
