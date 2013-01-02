# -*- encoding : utf-8 -*-
class DtgMailer < ActionMailer::Base
  default from: "admin@dtg.kiev.ua"

  def welcome_email( uname, user, user_mail, pass)
  	@uname = uname
    @user = user
    @user_mail = user_mail
    @pass = pass
    @url  = "http://z.dtg.kiev.ua/"
    mail(:to => user_mail.email, :subject => "Registration on DTG-Zayavka")
  end
end
