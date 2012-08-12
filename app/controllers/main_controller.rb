class MainController < ApplicationController
  # def index
    # menu
    # render('menu')
  # end
  
  def menu
    # display text & links
  end

  def login
    # login form
  end
  
  def attempt_login
    authorized_user = Main.authenticate(params[:login], params[:hash_pass])
    if authorized_user
      # TODO: mark user as logged in
      flash[:notice] = "You are now logged in."
      redirect_to( :controller => 'admin', :action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to( :action => 'login')
    end
    
  end
  
  def logout
    # TODO: mark user as logged out
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end
end
