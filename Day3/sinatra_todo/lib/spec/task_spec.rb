require_relative '../sinatra.rb'

RSpec.describe "Task" do 

  before :each do
      @task = Task.new("Buy the milk")
  end

  describe "#initialize" do

    it "The id of the first intance is 1" do
      expect(@task.id).to eq(1)
    end

    it "The id of the second task is 2" do
      expect(@task.id).to eq(2)
    end
    
    it "The completed is false by default" do
      expect(@task.completed).to be(false)
    end
  end

  describe "#completed?" do

    it "check if task is completed. False by default" do
      expect(@task.completed).to be(false)
    end
  end

  describe "#complete!" do

    it "Force completed equal true. By !" do
      @task.complete!
      expect(@task.completed).to be(true)
    end
  end

  describe "#make_incomplete!" do

    it "Force completed equal false. By !" do
      @task.make_incomplete!
      expect(@task.completed).to be(false)
    end
  end

  describe "#update_content!" do

    it "Update with the new content" do
      @task.update_content!("Walk the dog")
      expect(@task.content).to eq("Walk the dog")
    end
    it "Update de create_at atribute" do
      @task.update_content!("Walk the dog")
      expect(@task.update_at.strftime("%H:%M:%S")).to eq(Time.now.strftime("%H:%M:%S"))
    end
  end
end