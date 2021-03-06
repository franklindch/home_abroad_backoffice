class EmployeesController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_employee, only: [:edit, :update, :destroy]
	before_action :retrieve_partner_company, only: [:new, :create, :edit]

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_params)
		@employee.partner_company = @partner_company
	  if @employee.save
		  flash[:notice] = "Employer ajouté avec succès !"
		  redirect_to partner_companies_path
		else
			flash[:alert] = "Merci de lire les messages d'erreurs."
			render :new
		end
	end

	def edit; end

	def update
		@employee.update(employee_params)
		flash[:notice] = "Employer édité avec succès !"
	  redirect_to partner_companies_path
	end

	def destroy
		@employee.destroy
		redirect_to partner_companies_path
	end

	private

	def retrieve_employee
	  @employee ||= Employee.find(params[:id])
	end

	def retrieve_partner_company
	  @partner_company ||= PartnerCompany.find(params[:partner_company_id])
	end

	def employee_params
	  params.require(:employee).permit(
	    :intl_number, :main_contact, :job_position, :first_name, :last_name, :phone_number, :email, :partner_company_id
	  )
	end
end
