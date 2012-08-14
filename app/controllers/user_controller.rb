class UserController < ApplicationController
	
	layout 'user'

	before_filter :confirm_logged_in
	before_filter :confirm_priveleges_user
	
	def index
	end

	def login
	end

	def list
		@user = User.find(:all)
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
			flash[:notice] = "Successfully created"
			redirect_to( :controller => 'user', :action => 'list')
		else
			flash[:notice] = "Error creating user"
			redirect_to(:controller => 'user', :action => 'list')
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
