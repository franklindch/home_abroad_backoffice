class EmployeesController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_employee, only: [:edit, :update, :destroy, :show]

	def new
		@employee = Employee.new
	end


	private

	def retrieve_employee
	  @employee ||= Employee.find(params[:id])
	end

	def partner_company_params
	  params.require(:employee).permit(
	    :main_contact, :job_position, :first_name, :last_name, :phone_number, :email
	  )
	end
end
