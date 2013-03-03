# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'main', :action => 'login')
      return false # halts the before_filter
    else
      return true
    end
  end

  def confirm_priveleges_admin
    if session[:priv] != 1
      flash[:notice] = "You must be logged in as ADMINISTARTOR."
      redirect_to(:controller => 'main', :action => 'login')
      return false
    else
      return true
    end
  end

  def confirm_priveleges_manager
    if session[:priv] == 2  || session[:priv] == 1
      return true
    else
      flash[:notice] = "You must be logged in as MANAGER."
      redirect_to(:controller => 'main', :action => 'login')
      return false
    end
  end

  def confirm_priveleges_user
    if session[:priv] == 3 || session[:priv] == 2
      return true
    else
      flash[:notice] = "You must be logged in as USER."
      redirect_to(:controller => 'main', :action => 'login')
      return false
    end
  end
  
end
