class QualificationsController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_family, only: [:new, :edit, :create]
	def new
	  @qualification = Qualification.new
	  create_child_details
	end

	def create
	  @qualification = Qualification.new(qualification_params)
	  @qualification.save
	  @family.update_columns(qualification_id: @qualification.id)
    redirect_to families_path
	end

	private

	def retrieve_family
	  @family = Family.find(params[:id])
	end

	def create_child_details
		2.times do
		  @qualification.child_details.build
		end
	end

	def qualification_params
		params.require(:qualification).permit(
		  :comment, child_details_attributes: [:id, :first_name, :last_name, :age, :comment, :_destroy]
		)
	end
end
