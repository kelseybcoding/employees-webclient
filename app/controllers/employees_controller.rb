class EmployeesController < ApplicationController

	def index
		@employees = Employee.all
	end

	def new
		
	end

	def create
		@employee = Unirest.post(
			"http://localhost:3001/api/v1/employees.json",
			headers: { "Accept" => "application/json"},
			parameters: {
				first_name: params[:first_name],
				last_name: params[:last_name],
				ssn: params[:ssn],
				email: params[:email]
			}).body

		render :show
	end
	
	def show
		@employee = Employee.find(params[:id])
	end

	def edit
		@id = params[:id]
	end

	def update
		@employee = Unirest.patch(
			"http://localhost:3001/api/v1/employees/#{params[:id]}.json",
			headers: { "Accept" => "application/json"},
			parameters: {
				first_name: params[:first_name],
				last_name: params[:last_name],
				ssn: params[:ssn],
				email: params[:email]
				birthday: params[:birthday]
			}).body

		render :show
		
	end

	def destroy
		Unirest.delete("http://localhost:3001/api/v1/employees/#{params[:id]}.json")
	end
end
