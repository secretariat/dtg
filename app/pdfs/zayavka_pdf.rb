# -*- encoding : utf-8 -*-
class ZayavkaPdf < Prawn::Document
  def initialize(zayavka, products, user)

    super(top_margin: 70)
    @zayavka = zayavka
    @user = user
    @products = products
    show
  end

  def show
	font_families.update(
    "Verdana" => {
      :bold => "prawn_fonts/verdanab.ttf",
      :italic => "prawn_fonts/verdanai.ttf",
      :normal  => "prawn_fonts/verdana.ttf" })
    font "Verdana", :size => 10

    text "Завление опросник № #{@zayavka.id} от #{@zayavka.created_at}     к Договору № #{@zayavka.dogovor} г.", :align => :center, :style => :bold
    move_down 5

    formatted_text [ { :text =>"Таможенный режим: "},
                        { :text => "#{@zayavka.tamrez}",:styles => [:underline]},
                        { :text => "     Тип гарантии: "},
                        { :text => "#{@zayavka.garantee}",:styles => [:underline]},
                        { :text => "     Вид транспорта: "},
                        { :text => "#{@zayavka.typetran}",:styles => [:underline]}]
    move_down 3
    if @zayavka.tamrez == "Временный" then
        formatted_text [{ :text => "Срок действия гарантии (мес.): "},
        { :text => "#{@zayavka.temp_period}", :styles => [:underline]}]
    end

    text "1. Отправитель товара", :align => :center, :style => :bold
    formatted_text [ { :text =>"1.1 Наименование фирмы: "},
								     { :text => "#{@zayavka.field_1_1}",:styles => [:underline]}]
		formatted_text [ { :text =>"1.2 Юридический адрес, телефон, email: "},
								     { :text => "#{@zayavka.field_1_2}",:styles => [:underline]}]
		formatted_text [ { :text =>"1.3 Руководитель, ФИО: "},
								     { :text => "#{@zayavka.field_1_3}",:styles => [:underline]}]

    text "2. Информация о товаре", :align => :center, :style => :bold
    move_down 5
    formatted_text [ { :text =>"2.1 Валюта контракта: "},
                                     { :text => "#{@zayavka.z_currency}",:styles => [:underline]}]
    move_down 5
    items = [["Наименование товара", "Код УКТВЭД", "Номенклатура", "Кол-во", "Ед. изм.", "Фактур. с-ть за ед.", "Фактур. с-ть всего товара", "Доп. Информация", "Данные расчета"]]

	items += @products.map do |item|
    [
        item.naim,
        item.codyktved,
        item.nomenkl,
        item.kolvo,
        item.edizm,
        item.factstoim,
        item.factstoim_all,
        item.dopinfo,
        item.opis_all
    ]
    end

    table(items, :header => true) do
        row(0).background_color = '808080'
        row(0).font_style = :bold
        column(0).width=100
        column(1).width=30
        column(2).width=90
        column(3).width=35
        column(4).width=50
        column(5).width=40
        column(6).width=40
        column(7).width=70
        rows(0..50).align = :center
        rows(0..50).style(:size => 8)
    end

    move_down 5
    text "3. Избранный маршрут транзитного перемещения", :align => :center, :style => :bold
    move_down 5
    formatted_text [ { :text =>"3.1 Пункт отправления: "},
								     { :text => "#{@zayavka.field_3_1}",:styles => [:underline]}]
		formatted_text [ { :text =>"3.2 Таможня отправления: "},
								     { :text => "#{@zayavka.field_3_2}",:styles => [:underline]}]
		formatted_text [ { :text =>"3.3 Пункт назначения: "},
								     { :text => "#{@zayavka.field_3_3}",:styles => [:underline]}]
		formatted_text [ { :text =>"3.4 Таможня назначения: "},
								     { :text => "#{@zayavka.field_3_4}",:styles => [:underline]}]
    move_down 5
    text "4. Получатель товара", :align => :center, :style => :bold
    formatted_text [ { :text =>"4.1 Наименование фирмы: "},
								     { :text => "#{@zayavka.field_4_1}",:styles => [:underline]}]
		formatted_text [ { :text =>"4.2 Юридический адрес, телефон, email: "},
								     { :text => "#{@zayavka.field_4_2}",:styles => [:underline]}]
		formatted_text [ { :text =>"4.3 Руководитель, Ф.И.О.: "},
								     { :text => "#{@zayavka.field_4_3}",:styles => [:underline]}]
    move_down 5
    text "5. Субъект ВЭД, заключивший внешнеэкономический договор", :align => :center, :style => :bold
    move_down 5
    formatted_text [ { :text =>"5.1 Наименование фирмы: "},
								     { :text => "#{@zayavka.field_5_1}",:styles => [:underline]}]
		formatted_text [ { :text =>"5.2 Юридический адрес, телефон, email: "},
								     { :text => "#{@zayavka.field_5_2}",:styles => [:underline]}]
		formatted_text [ { :text =>"5.3 Руководитель, ФИО: "},
								     { :text => "#{@zayavka.field_5_3}",:styles => [:underline]}]
		formatted_text [ { :text =>"5.4 ЕГРПОУ: "},
								     { :text => "#{@zayavka.field_5_4}",:styles => [:underline]}]
    formatted_text [ { :text =>"5.5 Код налогоплательщика: "},
								     { :text => "#{@zayavka.field_5_5}",:styles => [:underline]}]
		formatted_text [ { :text =>"5.6 Договор внешнеэкономический №: "},
								     { :text => "#{@zayavka.field_5_6} от #{@zayavka.field_5_6_1}",:styles => [:underline]}]
		formatted_text [ { :text =>"5.7 Счет фактура №: "},
								     { :text => "#{@zayavka.field_5_7} от #{@zayavka.field_5_7_1}",:styles => [:underline]}]
    move_down 5
    text "6. Лицо заключившее договор на предоставление финансовой гарантии", :align => :center, :style => :bold
    move_down 5
    formatted_text [ { :text =>"6.1 Полное наименование фирмы: "},
								     { :text => "#{@user.cname}",:styles => [:underline]}]
		formatted_text [ { :text =>"6.2 Юридический адрес, телефон, email: "},
								     { :text => "#{@user.uaddr}",:styles => [:underline]}]
		formatted_text [ { :text =>"6.3 Руководитель, Ф.И.О.: "},
								     { :text => "#{@user.chef}",:styles => [:underline]}]
    move_down 5
    text "7. Экспедиторская организация", :align => :center, :style => :bold
    move_down 5
    formatted_text [ { :text =>"7.1 Наименование фирмы: "},
								     { :text => "#{@zayavka.field_7_1}",:styles => [:underline]}]
		formatted_text [ { :text =>"7.2 Юридический адрес, телефон, email: "},
								     { :text => "#{@zayavka.field_7_2}",:styles => [:underline]}]
		formatted_text [ { :text =>"7.3 Руководитель, Ф.И.О.: "},
								     { :text => "#{@zayavka.field_7_3}",:styles => [:underline]}]
		formatted_text [ { :text =>"7.4 Код Ж/Д перевозки: "},
								     { :text => "#{@zayavka.field_7_4}",:styles => [:underline]}]
    move_down 5
    text "8. Информация о перевозчике и транспортном средстве", :align => :center, :style => :bold
    move_down 5
        formatted_text [ { :text =>"8.1 Наименование перевозчика: "},
								     { :text => "#{@zayavka.field_8_1}",:styles => [:underline]}]
		formatted_text [ { :text =>"8.2 Юридический адрес, телефон, email: "},
								     { :text => "#{@zayavka.field_8_2}",:styles => [:underline]}]
		formatted_text [ { :text =>"8.3 Руководитель, Ф.И.О.: "},
								     { :text => "#{@zayavka.field_8_3}",:styles => [:underline]}]
		formatted_text [ { :text =>"8.4 Для ж/д:    № вагона: "},
								     { :text => "#{@zayavka.field_8_4_1}",:styles => [:underline]},
										 { :text =>"   № контейнера: "},
								     { :text => "#{@zayavka.field_8_4_2}",:styles => [:underline]}]
	  formatted_text [ { :text =>"8.5 Для авто:   Тип, марка, гос.№: "},
								     { :text => "#{@zayavka.field_8_5}",:styles => [:underline]}]
		formatted_text [ { :text =>"8.5.1 ФИО Водителя: "},
								     { :text => "#{@zayavka.field_8_6}",:styles => [:underline]}]
		formatted_text [ { :text =>"8.5.2 Паспортные данные: "},
								     { :text => "#{@zayavka.field_8_7}",:styles => [:underline]}]
    move_down 5
    text "9. Дополнительная информация", :align => :center, :style => :bold
    move_down 5
    formatted_text [ { :text =>"#{@zayavka.field_9}",  :align => :center,:styles => [:underline]}]
    move_down 5
    text "10. Лицо заполнившее заявку", :align => :center, :style => :bold
        formatted_text [ { :text =>"10.1 ФИО: "},
                                     { :text => "#{@zayavka.field_10_1}",:styles => [:underline]}]
        formatted_text [ { :text =>"10.2 Контактный телефон: "},
                                     { :text => "#{@zayavka.field_10_2}",:styles => [:underline]}]
        formatted_text [ { :text =>"10.3 E-mail: "},
                                     { :text => "#{@zayavka.field_10_3}",:styles => [:underline]}]
	end

end
