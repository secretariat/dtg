# -*- encoding : utf-8 -*-
class AdminController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in
	before_filter :confirm_priveleges_admin

	def index
		@manager = Manager.order("managers.id DESC")
	end

	def login
	end

	def list
		@admin = Admin.order("created_at DESC")
	end

	def new
    @admin = Admin.new
    @main = Main.new
  end

  def create
  	@admin = Admin.new( params[:admin] )
  	@main = Main.new( params[:main] )
  	@main.admin = @admin
  	@main.owner_id = 0
  	@main.priv_level = 1
  	@pass = @main.password
		if @main.save then
			@uname = @main.login
			flash[:notice] = "Администратор создан успешно"
			DtgMailer.delay.welcome_email( @uname, @main, @main.admin, @pass )
			redirect_to( :controller => 'admin', :action => 'list')
		else
			flash[:notice] = "#{@main.errors.full_messages.to_sentence}, #{@admin.errors.full_messages.to_sentence}"
			redirect_to( :controller => 'admin', :action => 'new')
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

  # def delete
  # 	@admin = Admin.find( params[:id] )
  # end

  def destroy
  	Admin.find( params[:id] ).main.destroy
  	flash[:notice] = "Администратор успешно удален"
  	redirect_to( :action => 'list')
  end
end
