class XmlMailer < ActionMailer::Base
  default from: "admin@dtg.kiev.ua"

  def xml_email( email_to, zayavka, product )
  	builder = Nokogiri::XML::Builder.new do |xml|
    xml.zayavka {
      xml.id zayavka.id
      xml.date zayavka.created_at
      xml.tamrezym zayavka.tamrez
      xml.typetrans zayavka.typetran
      xml.typegarantee zayavka.garantee
      
      xml.item_ender{
      	xml.companyname zayavka.field_1_1
      	xml.uadrphonemail zayavka.field_1_2
      	xml.chef zayavka.field_1_3
      }
      xml.products{
      	x = 1
      	product.each do |pr|  
      		xml.item(:id => x){
	      		xml.naim pr.naim
	      		xml.cod pr.codyktved
	      		xml.nomennkl pr.nomenkl
	      		xml.number pr.kolvo
	      		xml.factprice pr.factstoim
	      		xml.dopinfo pr.dopinfo
	      		xml.calc_data pr.opis_all
      		}
      	 	
      	 	x+=1
      	end
      }
      # products table should be here
      xml.marshryt{
    		xml.startpoint zayavka.field_3_1
	      xml.startcustom zayavka.field_3_2
	      xml.endtpoint zayavka.field_3_3
	      xml.endcustom zayavka.field_3_4
      }   

      # 4 Polychatel tovara
      xml.reciever{
      	xml.companyname zayavka.field_4_1
      	xml.uadrphonemail zayavka.field_4_2
      	xml.chef zayavka.field_4_3	
      }
      
      # 5 Sybekt VED
      xml.sybekt_ved{
	      xml.companyname zayavka.field_5_1
	      xml.uadrphonemail zayavka.field_5_2
	      xml.chef zayavka.field_5_3
	      xml.egrpoy zayavka.field_5_4
	      xml.kod_pl zayavka.field_5_5
	      xml.dognum zayavka.field_5_6
	      xml.bill zayavka.field_5_7
	     }
      # 7 Ekspeditory
      xml.ekspeditory{
	      xml.companyname zayavka.field_7_1
	      xml.uadrphonemail zayavka.field_7_2
	      xml.chef zayavka.field_7_3
	      xml.kod_zd zayavka.field_7_4
      }
      # 8 Info pro perevozchika
      xml.transporter{
	      xml.name zayavka.field_8_1
	      xml.uadrphonemail zayavka.field_8_2
	      xml.chef zayavka.field_8_3
	      xml.vagnum zayavka.field_8_4_1
	      xml.contnum zayavka.field_8_4_2
	      xml.avto zayavka.field_8_5
	      xml.driverpib zayavka.field_8_6
	      xml.passport zayavka.field_8_7
	    }

	    #9 DopInfo
	    xml.dopopolnitelno{
	    	xml.dopinfo zayavka.field_9	
	    }

    }
		end
    attachments['report.xml'] = {mime_type: 'application/xml',
                              		content: builder.to_xml }
    mail(:to => email_to.email, :subject => "Zayavka Send")
  end

end