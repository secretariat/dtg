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
		if @main.save then
			flash[:notice] = "Successfully created"
			redirect_to( :controller => 'admin', :action => 'index')
		else
			redirect_to('index')
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
