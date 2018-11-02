class TodoController < ApplicationController

	def index
		@all_todos = Todo.all
	end 

	def deadline
		@all_todos = Todo.all
	end

	def create
		@title = params[:title]
		@content = params[:content]
		@due_date = params[:due_date]
		@priority = params[:priority]
		@finish = false
		new_todo = Todo.new(title: @title, content: @content, due_date: @due_date, priority: @priority, finish: @finish) 
		if @title == "" 
			redirect_to add_path
		elsif new_todo.save
			redirect_to index_path
		else 
			redirect_to add_path
		end
	end

	def edit
		@todo = Todo.find_by(id: params[:id])
	end

	def update
		@todo = Todo.find_by(id: params[:id])
		@todo.title = params[:title]
		@todo.content = params[:content]
		@todo.due_date = params[:due_date]
		@todo.priority = params[:priority]
		if @todo.save
			redirect_to index_path
		else
			render :edit
		end
 	end


	def destroy 
		@todo = Todo.find_by(id: params[:id])
		@todo.destroy
		redirect_to index_path
	end

	def complete
		@todo = Todo.find_by(id: params[:id])
		@todo.finish = !(@todo.finish)
		if @todo.save
			redirect_to index_path
		end
	end
end