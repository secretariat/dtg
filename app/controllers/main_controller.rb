class MainController < ApplicationController
  # def index
    # menu
    # render('menu')
  # end
  
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
    # display text & links
  end

  def login
    # login form
  end
  
  def attempt_login
    authorized_user = Main.authenticate(params[:login], params[:hash_pass])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:login] = authorized_user.login
      session[:priv] = authorized_user.priv_level
      flash[:notice] = "You are now logged in."
      redirect_to( :controller => 'admin', :action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to( :action => 'login')
    end
    
  end
  
  def logout
    session[:user_id] = nil
    session[:login] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end
end
