class PasswordChecker
	attr_reader :password
	def initialize
		@password = password
	end

	def check_longer? password
		password.size > 7
	end

	def check_letter? password
		/[a-z]/.match(password) && /[A-Z]/.match(password)
	end

	def check_number? password
		/[0-9]/.match(password)
	end

	def check_symbol? password
		/[^0-9A-Za-z]/.match(password)
	end

	def check_uppercase? password
		/[A-Z]/.match(password)
	end

	def check_downcase? password
		/[a-z]/.match(password)
	end
	
	def include_string? password, string
		password.include? string
	end
	
	def check_container_name_domain? email, password
		name = email.split("@")
		domain = name[1].split(".")
		include_string?(password, name[0]) || include_string?(password, domain[0])
	end

	def check_password? email, password
		check_longer?(password) && check_letter?(password) && check_number?(password) && check_symbol?(password) && check_uppercase?(password) && check_downcase?(password) && !check_container_name_domain?(email,password)

	end
end