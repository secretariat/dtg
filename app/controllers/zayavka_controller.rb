# -*- encoding : utf-8 -*-

class ZayavkaController < ApplicationController
	
	layout 'user'
	before_filter :get_uniq_user 

	def copy
		@zayavka = Zayavka.new( Zayavka.find( params[:id] ).attributes )
		@ttt = Zayavka.last
		if( @ttt == nil ) then
			@zid = 1
		else
			@zid = @ttt.id+1
		end

		1.times do
			@zayavka.products.build
		end
		@user = User.find( session[:uid] )
		
		render 'new'
	end

	def list	
		@zayavkas = Zayavka.where( :user_id => session[:uid] ) 
	end

	def show
		@zayavka = Zayavka.find( params[:id] )
		@user = User.find( session[:uid] )
		@products = @zayavka.products
		respond_to do |format|
      format.html
      format.pdf do
        pdf = ZayavkaPdf.new(@zayavka, @products, @user)
        send_data pdf.render, filename: "#{@zayavka.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
	end

	def new
		@zayavka = Zayavka.new
		
		@ttt = Zayavka.last
		if( @ttt == nil ) then
			@zid = 1
		else
			@zid = @ttt.id+1
		end

		1.times do
			@zayavka.products.build
		end
		@user = User.find( session[:uid] )
	end

	def create

  	@user = User.find( session[:uid] )
		@zayavka = @user.zayavkas.new( params[:zayavka] )
  	@zayavka.status = 1
  	@zayavka.usercount = @user.zcount
  	@user.zcount += 1
		if @zayavka.save then
			@user.save
			if( params[:send_button] ) then 
				@zayavka.update_attributes( :status => 2)
				@products = @zayavka.products
				@chmail = Chmail.find( :last )
				XmlMailer.delay.xml_email( @chmail, @zayavka, @products )
				# XmlMailer.xml_email( @chmail, @zayavka, @products ).deliver
			end
			flash[:notice] = "Заявка создана успешно"
			redirect_to( :controller => 'user', :action => 'index')
		else
			flash[:notice] = "Ошибка при создании Заявки"
			redirect_to(:controller => 'user', :action => 'new')
		end 

	end

	def edit
		@zayavka = Zayavka.find( params[:id] )
		@user = User.find( session[:uid] )
	end

	def update
  	@zayavka = Zayavka.find( params[:id] )
  	@user = User.find( session[:uid] )
		if @zayavka.update_attributes( params[:zayavka]) then
			if( params[:send_button] ) then 
				@zayavka.update_attributes( :status => 2)
				@products = @zayavka.products
				@chmail = Chmail.find( :last )
				XmlMailer.delay.xml_email( @chmail, @zayavka, @products )
			end
			flash[:notice] = "Заявка успешно отредактирована"
			redirect_to( :controller => 'user', :action => 'index')
		else
			render('edit')
		end  	
  end


  # def send_xml
  # 	@user = User.find( session[:uid] )
		# @zayavka = @user.zayavkas.new( params[:zayavka] )
  # 	@zayavka.status = 1
  # 	@zayavka.usercount = @user.zcount
  # 	@user.zcount += 1
		# if @zayavka.save then
		# 	@user.save
		# 	@chmail = Chmail.find( :last )
		# 	XmlMailer.xml_email( @chmail, @zayavka ).deliver
		# 	flash[:notice] = "Заявка создана успешно"
		# 	redirect_to( :controller => 'user', :action => 'index')
		# else
		# 	flash[:notice] = "Ошибка при создании Заявки"
		# 	redirect_to(:controller => 'user', :action => 'new')
		# end 
  # end

	private

	def get_uniq_user
		main = Main.find( session[:user_id] )
		user = main.user
		session[:uid] = user.id
		return true
	end

end
