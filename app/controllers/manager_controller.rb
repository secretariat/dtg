class ManagerController < ApplicationController
	
	layout 'admin'

	def index
	end

	def login
	end

	def list
		@manager = Manager.order("managers.id DESC")
	end

	def new
    @manager = Manager.new
    @main = Main.new
  end

  def create
  	@manager = Manager.new( params[:manager] )
  	@main = Main.new( params[:main] )
  	@main.manager = @manager
  	@pass = @main.password
		if @main.save then
			# DtgMailer.welcome_email( @main, @main.manager, @pass ).deliver
			flash[:notice] = "Successfully created"
			redirect_to( :controller => 'admin', :action => 'index')
		else
			flash[:notice] = "Error creating manager"
			redirect_to(:controller => 'manager', :action => 'index')
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
