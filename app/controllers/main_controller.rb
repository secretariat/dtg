# -*- encoding : utf-8 -*-
class MainController < ApplicationController

  layout 'main'

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
      case authorized_user.priv_level
        when 1 then redirect_to( :controller => 'admin', :action => 'index')
        when 2 then redirect_to( :controller => 'manager', :action => 'index')
        when 3 then redirect_to( :controller => 'user', :action => 'index')
        when 4 then redirect_to( :controller => 'manager', :action => 'index')
        else redirect_to( :action => 'login')
      end


    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to( :action => 'login')
    end

  end

  def destroy
    Main.find( params[:id] ).destroy
    flash[:notice] = "Пользователь успешно удален"
    redirect_to( :controller => 'user', :action => 'list')
  end

  def logout
    session[:user_id] = nil
    session[:uid] = nil
    session[:login] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end
end
