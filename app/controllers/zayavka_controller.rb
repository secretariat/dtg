# -*- encoding : utf-8 -*-

class ZayavkaController < ApplicationController

	layout 'user'
	before_filter :get_uniq_user, :except => [:zshow]

	def duplicate
		@zayavka = Zayavka.find( params[:id] ).dup
		@zayavka.field_8_4_1 = ""
		@zayavka.field_8_4_2 = ""
		@zayavka.field_8_5 = ""
		@zayavka.field_8_6 = ""
		@zayavka.field_8_7 = ""
		# @zayavka = Zayavka.new( Zayavka.find( params[:id] ).attributes )
		# @zayavka = @z.duplicate
		# @zayavka.products = Zayavka.find( params[:id] ).products.clone
		@user = User.find( session[:uid] )
		@zcount = @user.zcount
		# render 'new'
	end

	def list
		@zayavkas = Zayavka.where( :user_id => session[:uid] )
	end

	def show
		@zayavka = Zayavka.find( params[:id] )
		@user = User.find( session[:uid] )
		@zcount = @zayavka.usercount
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

		1.times do
			@zayavka.products.build
		end

		@user = User.find( session[:uid] )
		@zcount = @user.zcount
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
				@zayavka.update_attributes( :status => 2 )
				@products = @zayavka.products
				@chmail = Chmail.find( :last )

				# XmlMailer.delay.xml_email( @chmail, @zayavka, @products )
				XmlMailer.xml_email( @chmail, @user, @zayavka, @products ).deliver

			end
			flash[:notice] = "Заявка создана успешно"
			redirect_to( :controller => 'user', :action => 'index')
		else
			flash[:notice] = "Ошибка при создании Заявки"
			redirect_to(:controller => 'zayavka', :action => 'new')
		end

	end

	def edit
		@zayavka = Zayavka.find( params[:id] )
		@user = User.find( session[:uid] )
		@zcount = @zayavka.usercount
	end

	def update
  	@zayavka = Zayavka.find( params[:id] )
  	@user = User.find( session[:uid] )
  	@zcount = @zayavka.usercount
		if @zayavka.update_attributes( params[:zayavka]) then
			if( params[:send_button] ) then
				@zayavka.update_attributes( :status => 2)
				@products = @zayavka.products
				@chmail = Chmail.find( :last )
				# XmlMailer.delay.xml_email( @chmail, @zayavka, @products )
				XmlMailer.xml_email( @chmail, @user, @zayavka, @products ).deliver
			end
			flash[:notice] = "Заявка успешно отредактирована"
			redirect_to( :controller => 'user', :action => 'index')
		else
			render('edit')
		end
  end

	def destroy
  	Zayavka.find( params[:id] ).destroy
  	flash[:notice] = "Заявка успешно удалена."
  	redirect_to :back
  end

  private

	def get_uniq_user
		main = Main.find( session[:user_id] )
		user = main.user
		session[:uid] = user.id
		return true
	end

end
