class UserController < ApplicationController
	
	layout 'user'

	before_filter :confirm_logged_in
	before_filter :confirm_priveleges_user
	
	def index
	end

	def show
		@user = User.find( params[:cur_user] )
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
			flash[:notice] = "User successfully created"
			redirect_to( :controller => 'manager', :action => 'index')
		else
			flash[:notice] = @main.errors.full_messages
			redirect_to(:controller => 'user', :action => 'new')
		end  	
  end

  def edit
  	# @projects = Project.find( params[:id] )
  end

  def update
  # 	@projects = Project.find( params[:id] )
		# if @projects.update_attributes( params[:projects]) then
		# 	flash[:notice] = "Project Updated Successfully"
		# 	redirect_to(:action => 'list')
		# else
		# 	render('edit')
		# end  	
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
