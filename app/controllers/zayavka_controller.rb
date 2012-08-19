class ZayavkaController < ApplicationController
	
	layout 'user'
	def new
		@zayavka = Zayavka.new
	end

	def create
		# @zayavka = Zayavka.new( params[:zayavka] )
  
		# if @zayavka.save then
		# 	# DtgMailer.welcome_email( @main, @main.manager, @pass ).deliver
		# 	flash[:notice] = "Заявка создана успешно"
		# 	redirect_to( :controller => 'zayavka', :action => 'list')
		# else
		# 	flash[:notice] = "Ошибка при создании Заявки"
		# 	redirect_to(:controller => 'user', :action => 'new')
		# end 

	end

end
