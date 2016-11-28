class UsersController < ApplicationController
	def index
		@user = User.new
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
		#redirect_to @user
		redirect_to root_path
	    else
		render 'new'
	    end
	end

	def show
		@user = User.find(params[:id])

	end

	def show_all_users
		@user = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(params[:user])
		redirect_to @user
		
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to root_path
	end

end
