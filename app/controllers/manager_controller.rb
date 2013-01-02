# -*- encoding : utf-8 -*-
class ManagerController < ApplicationController
	
	layout 'manager'
	

	before_filter :confirm_logged_in
	before_filter :confirm_priveleges_manager
	
	def index
		@mains = Main.where(:owner_id => session[:user_id]).order('created_at DESC')
	end

	def status
		@zayavkas = Zayavka.where( :user_id => params[:id] ).order('created_at DESC') 
	end

	def show
		@manager = Manager.find( params[:id] )
		render :layout => "admin"	
	end

	def list
		@manager = Manager.order("managers.id ASC")
		render :layout => "admin"
	end

	def new
    @manager = Manager.new
    @main = Main.new
    render :layout => "admin"	
  end

  def create
  	@manager = Manager.new( params[:manager] )
  	@main = Main.new( params[:main] )
  	@main.manager = @manager
  	@main.owner_id = session[:user_id]
  	@main.priv_level = 2
  	@pass = @main.password
		
		if @main.save then
			@uname = @main.manager.pib
			DtgMailer.delay.welcome_email( @uname, @main, @main.manager, @pass )
			flash[:notice] = "Менеджер создан успешно"
			redirect_to( :controller => 'admin', :action => 'index')
		else
			flash[:notice] = "#{@main.errors.full_messages.to_sentence}, #{@manager.errors.full_messages.to_sentence}"
			redirect_to(:controller => 'manager', :action => 'new')
		end 
	
	end	

  def edit
  	@manager = Manager.find( params[:id] )
  	render :layout => "admin"	
  end

  def update
  	@manager = Manager.find( params[:id] )
		if @manager.update_attributes( params[:manager]) then
			flash[:notice] = "Пользователь успешно отредактирован"
			redirect_to( :controller => 'manager', :action => 'list')
		else
			render('edit')
		end  	
  end

  def destroy
  	Manager.find( params[:id] ).main.destroy
  	flash[:notice] = "Менеджер успешно удален"
  	redirect_to(:action => 'list')
  end
end
