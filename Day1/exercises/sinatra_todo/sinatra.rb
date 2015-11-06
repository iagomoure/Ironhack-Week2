require 'rspec'
require 'yaml/store'


module TaskStore
  
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
  attr_reader :content, :id, :completed, :created_at, :update_at

  @@current_id = 1

  def initialize(content, completed = false)
    @id = @@current_id
    @content = content
    @@current_id += 1
    @completed = false
    @created_at = Time.now
    @update_at = nil
  end

  def complete?
    @completed
  end

  def complete!
    @completed = true
  end

  def make_incomplete!
    @completed = false
  end
  def update_content!(new_content)
    @content = new_content
    @update_at = Time.now
  end
end

class TodoList
  attr_reader :tasks, :user
  include TaskStore
    
    def initialize(user)
      @tasks = []
      @user = user
      @todo_store = YAML::Store.new("./public/tasks.yml")
    end

    def add_task(task)
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
    elsif order == "ASC"
      @tasks.sort {|task1,task2| task1.created_at <=> task2.created_at}
    else
      puts "Method order incorrect"
    end
  end
end



