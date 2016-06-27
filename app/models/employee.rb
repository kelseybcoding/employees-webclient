class Employee

	attr_reader :id
	attr_accessor :first_name, :last_name, :email, :birthday

	def initialize(hash_options)
		@id = hash_options["id"]
		@first_name = hash_options["fname"]
		@last_name = hash_options["lname"]
		@email = hash_options["email"]
		@ssn = hash_options["ssn"]
		@birthday = hash_options["birthday"]

	end

	def full_name
		"#{first_name}} #{last_name}"
	end

	def self.all
		api_response = Unirest.get("http://localhost:3001/api/v1/employees.json").body
		
		employee_collection = []

		api_response.each do |employee_hash|
			employee_collection << Employee.new(employee_hash)
		end

		employee_collection
	end

	def self.find(api_id)
		Employee.new(Unirest.get("http://localhost:3001/api/v1/employees/#{api_id]}.json").body)
	end

	# def self.delete(api_id)
	# 	Employee.destroy(Unirest.delete("http://localhost:3001/api/v1/employees/#{params[:id]}.json")
	# end
end