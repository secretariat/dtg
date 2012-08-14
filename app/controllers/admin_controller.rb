class AdminController < ApplicationController
	
	layout 'admin'
	
	before_filter :confirm_logged_in

	def index
		@manager = Manager.order("managers.id ASC")
	end

	def login
	end

	def list
		@admin = Admin.order("admins.id DESC")
	end

	def new
    @admin = Admin.new
    @main = Main.new
  end

  def create
  	@admin = Admin.new( params[:admin] )
  	@main = Main.new( params[:main] )
  	@main.owner_id = session[:user_id]
  	@main.admin = @admin
  	@pass = @main.password
		if @main.save then
			flash[:notice] = "Admin successfully created"
			DtgMailer.welcome_email( @main, @main.admin, @pass ).deliver
			redirect_to( :controller => 'admin', :action => 'list')
		else
			flash[:notice] = @main.errors.full_messages
			redirect_to( :controller => 'admin', :action => 'list')
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
