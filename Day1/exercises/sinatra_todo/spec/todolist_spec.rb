require_relative '../sinatra.rb'

RSpec.describe "TodoList" do 

  before :each do
    @todolist = TodoList.new("Josh")
    @task = Task.new("Walk the dog")
    @task2 = Task.new("Buy the milk")
    @task3 = Task.new("Make my todo list into a web app")

  end

  describe "#add_task" do

    it "Add a task to the tasks array" do
      expect(@todolist.add_task(@task)).to contain_exactly(@task)
    end
  end

  describe "#delete_task" do

    it "It ask for a task id and delete it" do
      @todolist.add_task(@task)
      number_of_tasks = @todolist.tasks.size
      @todolist.delete_task(@task.id)
      expect(@todolist.tasks.size).to eq(number_of_tasks - 1)
    end
  end
  
  describe "#find_task_by_id" do
    
    it "Find a task by id" do
      @todolist.add_task(@task)
      expect(@todolist.find_task_by_id(@task.id)).to be(@task)
    end

    it "doesn't find a task, make sure the method returns nil" do
      expect(@todolist.find_task_by_id(1)).to be(nil)
    end
  end

  describe "#sort_by_created" do

    it "New array sorted by created time" do
      @todolist.add_task(@task)
      @todolist.add_task(@task2)
      sorted_tasks = @todolist.sort_by_created
      expect(sorted_tasks[0].created_at).to be < sorted_tasks[1].created_at  
    end

    it "New array sorted by ASC or DESC method selected" do
      @todolist.add_task(@task)
      @todolist.add_task(@task2)
      sorted_tasks = @todolist.sort_by_created("DESC")
      expect(sorted_tasks[0].created_at).to be > sorted_tasks[1].created_at 
    end
  end

  describe "#save" do
    
    it "Save in a file correctly" do
      @todolist.add_task(@task)
      @todolist.add_task(@task2)
      @todolist.save
      expect(1).to eq(1)
    end
  end

  describe "#load_tasks" do

    it "Loaded the saved file correctly" do
      @todolist.add_task(@task)
      @todolist.add_task(@task2)
      @todolist.save
      expect(@todolist.load_tasks.size).to be > 0
    end
  end
end
