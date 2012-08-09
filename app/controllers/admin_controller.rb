class AdminController < ApplicationController
	
	layout 'admin'

	def index
		@manager = Manager.order("managers.id DESC")
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
  	@main.admin = @admin
		if @main.save then
			flash[:notice] = "Successfully created"
			redirect_to(:action => 'index')
		else
			render('index')
		end  	

		# @main = Main.new( params[:main] )
		# if  then
		# 	flash[:notice] = "Successfully created"
		# 	redirect_to(:action => 'index')
		# else
		# 	render('index')
		# end 
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
