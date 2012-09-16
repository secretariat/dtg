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
    text "3. Избранный маршрут транзитного перемещения", :align => :center, :style => :bold
    text "3.1 Пункт отправления: #{@zayavka.field_3_1}"
    text "3.2 Таможня отправления: #{@zayavka.field_3_2}"
    text "3.3 Пункт назначения: #{@zayavka.field_3_3}"
    text "3.4 Таможня назначения: #{@zayavka.field_3_4}"
    text "4. Получатель товара", :align => :center, :style => :bold
    text "4.1 Наименование фирмы: #{@zayavka.field_4_1}"
    text "4.2 Юридический адрес, телефон, email: #{@zayavka.field_4_2}"
    text "4.3 Руководитель, Ф.И.О.: #{@zayavka.field_4_3}"
    text "5. Субъект ВЭД, заключивший внешнеэкономический договор", :align => :center, :style => :bold
    text "5.1 Наименование фирмы: #{@zayavka.field_5_1}"
    text "5.2 Юридический адрес, телефон, email: #{@zayavka.field_5_2}"
    text "5.3 Руководитель, ФИО: #{@zayavka.field_5_3}"
    text "5.4 ЕГРПОУ: #{@zayavka.field_5_4}"
    text "5.5 Код налогоплательщика: #{@zayavka.field_5_5}"
    text "5.6 Договор внешнеэкономический №: #{@zayavka.field_5_6}"
    text "5.7 Счет фактура №: #{@zayavka.field_5_7}"
    text "6. Лицо заключившее договор на предоставление финансовой гарантии", :align => :center, :style => :bold
    text "6.1 Полное наименование фирмы: #{@user.pib}"
    text "6.2 Юридический адрес, телефон, email: #{@user.uaddr}"
    text "6.3 Руководитель, Ф.И.О.: #{@user.chef}"
    text "7. Экспедиторская организация", :align => :center, :style => :bold
    text "7.1 Наименование фирмы: #{@zayavka.field_7_1}"
    text "7.2 Юридический адрес, телефон, email: #{@zayavka.field_7_2}"
    text "7.3 Руководитель, Ф.И.О.: #{@zayavka.field_7_3}"
    text "7.4 Код Ж/Д перевозки: #{@zayavka.field_7_4}"
    text "8. Информация о перевозчике и транспортном средстве", :align => :center, :style => :bold
    text "8.1 Наименование перевозчика: #{@zayavka.field_8_1}"
    text "8.2 Юридический адрес, телефон, email: #{@zayavka.field_8_2}"
    text "8.3 Руководитель, Ф.И.О.: #{@zayavka.field_8_3}"
    text "8.4 Для ж/д:"
    text "№ вагона: #{@zayavka.field_8_4_1}   № контейнера: #{@zayavka.field_8_4_2}"
    text "8.5 Для авто:   Тип, марка, гос.№: #{@zayavka.field_8_5}"
    text "8.5.1 ФИО Водителя: #{@zayavka.field_8_6}"
    text "8.5.2 Паспортные данные: #{@zayavka.field_8_7}"
    text "9. Дополнительная информация", :align => :center, :style => :bold
    text "#{@zayavka.field_9}", :align => :center

	end

  
end
