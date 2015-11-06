require_relative '../todo.rb'

RSpec.describe Task do 
	
	let (:task) {Task.new("Buy the milk")}

	describe "#initialize" do
		it "Create task correctly" do
			expect(task.content).to eq("Buy the milk")
		end

		it "Create time" do
			expect(task.created_at.strftime("%H:%M:%S")).to eq(Time.now.strftime("%H:%M:%S"))
		end
	end
	
	describe "#completed?" do
		it "check the task by default" do
			expect(task.completed?).to be(false)
		end
	end

	describe "#complete!" do
		it "task set to complete" do
			expect(task.complete!).to eq(true)
		end
	end

	describe "#make_incomplete!" do
		it "task set to incomplete" do
			expect(task.make_incomplete!).to eq(false)
		end
	end
	describe "#update_content!" do
		it "update text" do
			expect(task.update_content!("Walk the milk")).to eq("Walk the milk")
		end

		it "Update time" do
			task.update_content!("Walk the milk")
			expect(task.update_at.strftime("%H:%M:%S")).to eq(Time.now.strftime("%H:%M:%S"))
		end
	end
end	
puts "Muhahahaha"