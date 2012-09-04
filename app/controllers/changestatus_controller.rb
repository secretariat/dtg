require 'digest/md5'

class ChangestatusController < ApplicationController
	
	def update
		@zayavka = Zayavka.find( params[:id] )
		# @user = User.find( @zayavka.user_id )
		@hash = Digest::MD5.hexdigest( @zayavka.id.to_s	)
		# if( params[:hash] == @hash ) then 
			@zayavka.status = params[:status]
			@zayavka.save
		# end
	end

end
