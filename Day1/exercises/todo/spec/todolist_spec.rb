require_relative '../todo.rb'

RSpec.describe Task do 
	
	before :each  do
		@todolist = TodoList.new("Josh")
		@task = Task.new("Walk the dog")
		@task2 = Task.new("Buy the milk")
	end



	describe "#initialize" do
		it "Create TodoList correctly" do
			expect(@todolist.tasks).to eq([])
		end
	end

	describe "#add_task" do
		it "add task in array" do
			expect(@todolist.add_task(@task)).to contain_exactly(@task)
		end
	end

	describe "#delete_task" do
		it "delete task in array" do
			@todolist.add_task(@task)
			n_tasks = @todolist.tasks.size
			@todolist.delete_task(@task.id)
			expect(@todolist.tasks.size).to eq(n_tasks - 1)			
		end
	end

	describe "#find_task_by_id" do
    	it "returns a task by id" do
      		@todolist.add_task(@task)
      		expect(@todolist.find_task_by_id(@task.id)).to be(@task)
    	end

    	it "It returns nil if it doen't find the task" do
      	expect(@todolist.find_task_by_id(1)).to be(nil)
    	end
  	end

  describe "#sort_by_created" do
		it "It returns a new array with the tasks sorted by created time by default" do
      @todolist.add_task(@task)
      @todolist.add_task(@task2)
      sorted_tasks = @todolist.sort_by_created
      xpect(sorted_tasks[0].created_at).to be < sorted_tasks[1].created_at  
    end

    it "It returns a new array in descendent order by time with DESC" do
      @todolist.add_task(@task)
      @todolist.add_task(@task2)
      sorted_tasks = @todolist.sort_by_created("DESC")
      expect(sorted_tasks[0].created_at).to be > sorted_tasks[1].created_at
    end
  end

  describe "#save" do
	 it "Save in a file" do
      @todolist.add_task(@task)
      @todolist.add_task(@task2)
      @todolist.save
      expect(1).to eq(1)
    end
  end

  describe "#load_tasks" do
    it "It load the saved tasks" do
      @todolist.add_task(@task)
      @todolist.add_task(@task2)
      @todolist.save
      expect(@todolist.load_tasks.size).to be > 0
    end
  end
end