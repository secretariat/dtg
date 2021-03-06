# -*- encoding : utf-8 -*-
require 'digest/md5'

class ChangestatusController < ApplicationController

	def update
		@zayavka = Zayavka.find( params[:id] )
		# @user = User.find( @zayavka.user_id )
		@hash = Digest::MD5.hexdigest( @zayavka.id.to_s	)
		if( params[:hash] == @hash ) then
			@status = "SUCCESSFULLY"
			@zayavka.status = params[:status] if !params[:status].blank?
			@zayavka.garantdocnum = params[:gn] if !params[:gn].blank?
			@zayavka.garantsumma = params[:gsum] if !params[:gsum].blank?
			@zayavka.save
		else
			@status = "UNSUCCESSFULLY"
		end
	end

end
