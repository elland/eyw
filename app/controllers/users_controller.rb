class UsersController < ApplicationController
	def index
		
	end
	
	def new
		
	end
	
	def edit
		
	end
	
	def create
		@user = User.new params[:user]
		@user.save!
	end
	
	def update
		@user = User.find params[:id]
		@user.save!
	end
	
	def destroy
		
	end
end
