class QualificationsController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_family, only: [:new, :edit, :create]

	def new
	  @qualification = Qualification.new()
	  create_child_details
	  # create_potential_language_stays
	end

	def create
	  @qualification = Qualification.new(qualification_params)

	  if @qualification.save
		  if @family.update_columns(qualification_id: @qualification.id)
		    redirect_to families_path
		    flash[:notice] = "Qualification associée avec succès à la famille !"
		  else
		  	flash[:alert] = "Veuillez compléter les champs obligatoires."
		  	render :new
		  end
		end
	end

	def close_prospect
		@qualification = Qualification.find(params[:qualification])
		@qualification.status_to_close
		respond_to do |format|
		  format.html
		  format.js { render :js => "window.location = '/dashboard/families'" }
		end
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

	def create_potential_language_stays
		2.times do
		  @qualification.child_details.build
		end
	end

	def qualification_params
		params.require(:qualification).permit(
		  :comment, :refered_by, :reference_name, :contact_mode, :data_entry_responsible, :status,
		  child_details_attributes: [
		  	:id, :first_name, :last_name, :age, :comment, :gender, :email, :school, :school_grade, :duration, :month, :_destroy,
		  	potential_language_stays_attributes: [
		  		:id, :nature, :countries, :partner_companies, :_destroy
		  	]
		  ]
		)
	end
end
