require 'pry'
require 'rspec'
require 'time'
require 'yaml/store'

module StorageFunctions

  def save
    @todo_store.transaction do
    	@todo_store[@user] = @tasks
    end
  end

  def load_tasks
    YAML::load("./public/tasks.yml")
  end 

end

class Task
    
    attr_reader :content, :id, :created_at, :update_at
    @@current_id = 1
    
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @completed = false
        @created_at = Time.now
        @update_at = nil
    end

    def completed?
    	@completed 
    end

    def complete!
    	@completed = true
    end

    def make_incomplete!
    	@completed = false
    end

    def update_content! text
    	@update_at = Time.now
    	@content = text
    end
end

class TodoList
	
	attr_reader :tasks

	def initialize(user)
		@todo_store = YAML::Store.new("./public/tasks.yml")
		@tasks = []
		@user = user
	end

	def add_task task
		@tasks << task
	end

	def delete_task(id)
		@tasks.delete_if {|task| task.id == id}
	end

	def find_task_by_id(id)
    	@tasks.find {|task| task.id == id}
  	end

  	def sort_by_created(order = "ASC")
    	if order == "DESC"
      		@tasks.sort {|task1,task2| task2.created_at <=> task1.created_at}
    	else
      		@tasks.sort {|task1,task2| task1.created_at <=> task2.created_at}
    	end
  	end
end
