# -*- encoding : utf-8 -*-
class UserController < ApplicationController
	
	layout 'user'

	before_filter :confirm_logged_in
	before_filter :confirm_priveleges_user
	
	def index
		@zayavkas = Zayavka.where( :user_id => session[:uid]  ) 
	end

	def show
		@user = User.find( params[:id] )
		render :layout => "manager"	
	end

	def list
		@mains = Main.where(:owner_id => session[:user_id])
		render :layout => "manager"	
	end

	def new
    @user = User.new
    @main = Main.new
    render :layout => "manager"	
  end

  def create
  	@user = User.new( params[:user] )
  	@main = Main.new( params[:main] )
  	@main.user = @user
  	@main.owner_id = session[:user_id]
  	@main.priv_level = 3
  	@pass = @main.password
		if @main.save then
			# DtgMailer.welcome_email( @main, @main.user, @pass ).deliver
			flash[:notice] = "Пользователь создан успешно"
			redirect_to( :controller => 'manager', :action => 'index')
		else
			flash[:notice] = "#{@main.errors.full_messages.to_sentence}, #{@user.errors.full_messages.to_sentence}"
			redirect_to(:controller => 'user', :action => 'new')
		end  	
  end

  def edit
  	@user = User.find( params[:id] )
  	render :layout => "manager"	
  end

  def update
  	@user = User.find( params[:id] )
		if @user.update_attributes( params[:user]) then
			flash[:notice] = "User Updated Successfully"
			redirect_to( :controller => 'manager', :action => 'index')
		else
			render('edit')
		end  	
  end

  def delete
  	# @projects = Project.find( params[:id] )
  end

  def destroy
  	# Project.find( params[:id] ).destroy
  	# flash[:notice] = "Project destroyed"
  	# redirect_to(:action => 'list')
  end
end
