class AdminController < ApplicationController
	
	layout 'admin'

	def index
		# list
		# render('list')
	end

	def list
		# @projects = Project.where(:user_id => current_user.id)
		# @task = Task.new
	end

	def new
    @admin = Admin.new
  end

  def create
  	@main = Admin.new( params[:admin] )
    #	@projects.user = current_user
		# if @main.save then
			# flash[:notice] = "Администратор создан успешно"
			# redirect_to(:action => 'index')
		# else
			# render('index')
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
