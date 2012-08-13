class UserController < ApplicationController

	before_filter :confirm_logged_in
	
end
