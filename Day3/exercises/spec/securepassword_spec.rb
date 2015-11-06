require_relative '../securepassword.rb'

RSpec.describe "securepassword" do 

	before :each  do
		@pass_checker = PasswordChecker.new
		@password_strong = "Patata22%bonito"
	end

	describe "#Initialize" do
		it "Create PassChecker correctly" do
			expect(@pass_checker).to eq(@pass_checker)
		end
	end

	describe "#check_longer?" do
		it "return false if password is nil" do
			expect(@pass_checker.check_longer?("")).to be_falsy
		end
		it "return false if password is lower than seven" do
			expect(@pass_checker.check_longer?("patata")).to be_falsy
		end
		it "return true if password is higer than seven" do
			expect(@pass_checker.check_longer?(@password_strong)).to be_truthy
		end
	end	

	describe "#check_letter?" do
		it "return false if password hasn't got a letter" do
			expect(@pass_checker.check_letter?("12")).to be_falsy
		end

		it "return true if password has got almost a letter" do
			expect(@pass_checker.check_letter?(@password_strong)).to be_truthy
		end
	end

	describe "#check_number?" do
		it "return false if password hasn't got a number" do
			expect(@pass_checker.check_number?("ab")).to be_falsy
		end

		it "return true if password has got almost a number" do
			expect(@pass_checker.check_number?(@password_strong)).to be_truthy
		end
	end

	describe "#check_symbol?" do
		it "return false if password hasn't got a symbol" do
			expect(@pass_checker.check_symbol?("a1")).to be_falsy
		end

		it "return true if password has got almost a symbol" do
			expect(@pass_checker.check_symbol?(@password_strong)).to be_truthy
		end
	end

	describe "#check_uppercase?" do
		it "return false if password hasn't got an uppercase" do
			expect(@pass_checker.check_uppercase?("a1")).to be_falsy
		end

		it "return true if password has got almost an uppercase" do
			expect(@pass_checker.check_uppercase?(@password_strong)).to be_truthy
		end
	end

	describe "#check_downcase?" do
		it "return false if password hasn't got a downcase" do
			expect(@pass_checker.check_downcase?("A1")).to be_falsy
		end

		it "return true if password has got almost a downcase" do
			expect(@pass_checker.check_downcase?(@password_strong)).to be_truthy
		end
	end
	describe "#include_string?" do
		it "return false if password hasn't got the name and the domain" do
			expect(@pass_checker.include_string?("patata1", "rafa")).to be_falsy
		end

		it "return true if password has got almost name or domain" do
			expect(@pass_checker.include_string?("a1rafa%","rafa")).to be_truthy
		end
	end
	describe "#check_container_name_domain??" do
		it "return false if password hasn't got the name and the domain" do
			expect(@pass_checker.check_container_name_domain?("patata@patata.com", "rafa234%")).to be_falsy
		end

		it "return true if password has got almost name" do
			expect(@pass_checker.check_container_name_domain?("rafa@ironhack.com","111rafa323")).to be_truthy
		end
		it "return true if password has got almost domain" do
			expect(@pass_checker.check_container_name_domain?("rafa@ironhack.com","11ironhack323")).to be_truthy
		end
	end
	describe "#check_password?" do
		it "return false if password hasn't got all the rules" do
			expect(@pass_checker.check_password?("rafa@ironhack.com", "rafa123")).to be_falsy
		end

		it "return true if password is a strong password" do
			expect(@pass_checker.check_password?("rafa@ironhack.com","Patata22%bonito")).to be_truthy
		end
	end

end