# -*- encoding : utf-8 -*-
class ManagerController < ApplicationController

	layout 'manager'

	before_filter :confirm_logged_in
	before_filter :confirm_priveleges_manager

	def index
		if session[:priv] == 4
			@mains = Main.where( "owner_id = #{session[:user_id]} AND priv_level = 3" ).order('created_at DESC')
			@managers = Main.where("owner_id = #{session[:user_id]} AND priv_level = 2").order('created_at DESC')
		else
			@mains = Main.where(:priv_level => 3 ).order('created_at DESC')
		end
	end

	def status
		@zayavkas = Zayavka.where( :user_id => params[:id] ).order('created_at DESC')
		@user = User.find( params[:id] )
		if @zayavkas.size == 0 then
			render :action => 'znf'
		end
	end

	def show
		@manager = Manager.find( params[:id] )
		render :layout => get_layout
	end

	def zshow
		@zayavka = Zayavka.find( params[:id] )
		@user = User.find( @zayavka.user_id )
		@zcount = @zayavka.usercount
		@products = @zayavka.products
	end

	def list
		@manager = Manager.order("managers.id ASC")
		render :layout => get_layout
	end

	def super_list
		@mains = Main.where( :owner_id => params[:id] )
		render :template => 'user/list', :mains => @mains
	end


	def new
    @manager = Manager.new
    @main = Main.new
    render :layout => get_layout
  end

  def create
  	@manager = Manager.new( params[:manager] )
  	@main = Main.new( params[:main] )
  	@main.manager = @manager
  	@main.owner_id = session[:user_id]
  	priv = (@manager.supermanager.to_i == 1) ? 4 : 2
  	@main.priv_level = priv
  	@pass = @main.password

		if @main.save then
			@uname = @main.manager.pib
			DtgMailer.delay.welcome_email( @uname, @main, @main.manager, @pass )
			flash[:notice] = "Менеджер создан успешно"
			if session[:priv] == 1
				redirect_to( :controller => 'admin', :action => 'index')
			else
				redirect_to( :controller => 'manager', :action => 'index')
			end
		else
			flash[:notice] = "#{@main.errors.full_messages.to_sentence}, #{@manager.errors.full_messages.to_sentence}"
			redirect_to(:controller => 'manager', :action => 'new')
		end

	end

  def edit
  	@manager = Manager.find( params[:id] )
  	render :layout => get_layout
  end

  def update
  	@manager = Manager.find( params[:id] )
		if @manager.update_attributes( params[:manager]) then
			flash[:notice] = "Менеджер успешно отредактирован"
			# redirect_to( :controller => 'manager', :action => 'list')
			if session[:priv] == 1
				redirect_to( :controller => 'admin', :action => 'index')
			else
				redirect_to( :controller => 'manager', :action => 'index')
			end
		else
			render('edit')
		end
  end

  def destroy
  	Manager.find( params[:id] ).main.destroy
  	flash[:notice] = "Менеджер успешно удален"
  	if session[:priv] == 1
			redirect_to( :controller => 'admin', :action => 'index')
		else
			redirect_to( :controller => 'manager', :action => 'index')
		end
  end
end
