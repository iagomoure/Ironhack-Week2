require "sinatra"
require "sinatra/reloader" if development?
require 'yaml/store'

require_relative('./lib/Task.rb')
require_relative('./lib/TodoList.rb')


todo_list = TodoList.new("Josh")
todo_list.load_tasks

get "/task" do
	@tasks = todo_list.tasks 
	erb(:task_index)
end

get "/new_task" do
	erb(:new_task)
end

post "/create_task" do
	content_task = params[:content]
	task = Task.new(content_task)
	todo_list.add_task(task)
	todo_list.save
	redirect("/task")
end


post "/complete_task/:id" do
  @id = params[:id]
  @task = todo_list.find_task_by_id(id)
  @task.complete!
  todo_list.save
  redirect("/task")
end

