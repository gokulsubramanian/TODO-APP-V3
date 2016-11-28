class TodosController < ApplicationController
	before_filter :signed_in_user
	def index
		@task = Todo.new
		@user = current_user
		@task_list = @user.todos.order("deadline ASC")
	end

	def new
		@task = Todo.new
	end

	def create
		@task = current_user.todos.new(params[:todo])
		@task.save
		redirect_to welcome_path

	end

	def show_open_tasks
		@user = current_user
		@task_tmp = @user.todos.where("status = ?", "open")
        @task = @task_tmp.paginate(page: params[:page], per_page: 5)
		respond_to do |format|
      		format.html
      		format.csv { render text: @task_tmp.to_csv}
      		format.xml { render text: @task.to_xml}
       end
	end

	def show_done_tasks
		@user = current_user
		@task_tmp = @user.todos.where("status =?","done")
		@task = @task_tmp.paginate(page: params[:page], per_page: 5)
		respond_to do |format|
      		format.html
      		format.csv { render text: @task_tmp.to_csv }
      		format.xml { render xml: @task.to_xml}
       end
	end

	def show_archive_tasks
		@user = current_user
		@task_tmp = @user.todos.where("status = ?","archived")
		@task = @task_tmp.paginate(page: params[:page], per_page: 5)
		respond_to do |format|
      		format.html
      		format.csv { render text: @task_tmp.to_csv }
      		format.xml { render xml: @task}
       end
	end

	def show_priority_tasks
		@user = current_user
		@task_tmp = @user.todos.order("priority ASC")
		@task = @task_tmp.paginate(page: params[:page], per_page: 5)
		respond_to do |format|
      		format.html
      		format.csv { render text: @task_tmp.to_csv }
      		format.xml { render xml: @task}
       end
	end

	def show
		@user = User.find(params[:id])
		@task = @user.todos.paginate(page: params[:page])
	end

	def move_to_open_tasks
		@task = Todo.find(params[:id])
		@task.update_attributes(:status => "open")
		redirect_to show_open_tasks_path
	end

	def move_to_archive
		@task = Todo.find(params[:id])
		@task.update_attributes(:status => "archived")
		redirect_to show_archive_tasks_path
	end

	def mark_as_done
		@task = Todo.find(params[:id])
		@task.update_attributes(:status => "done")
		redirect_to show_done_tasks_path
	end

	def edit
		@task = Todo.find(params[:id])
	end

	def update
		@task = Todo.find(params[:id])
		@task.update_attributes(params[:todo])
		redirect_to show_open_tasks_path
	end

	def destroy
		Todo.find(params[:id]).destroy
		flash[:success] = "User Destroyed"
		redirect_to welcome_path
	end
end
