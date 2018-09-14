class QualificationsController < ApplicationController
	before_action :authenticate_user!
  before_action :retrieve_family, only: [:new, :edit, :create]

	def new
	  @qualification = Qualification.new()
	  create_child_details
	end

	def create
	  @qualification = Qualification.new(qualification_params)

	  if @qualification.save
		  if @family.update_columns(qualification_id: @qualification.id)
		    flash[:notice] = "Qualification associée avec succès à la famille !"
        redirect_to new_qualification_child_detail_path(@qualification)
		  else
		  	flash[:alert] = "Veuillez compléter les champs obligatoires."
		  	render :new
		  end
		end
	end

	def close_prospect
		@child_detail = ChildDetail.find(params[:child_detail])
		@child_detail.status_to_close
		respond_to do |format|
		  format.html
		  format.js { render :js => "window.location = '/dashboard/families'" }
		end
	end

	def reestablish_prospect
		@child_detail = ChildDetail.find(params[:child_detail])
		@child_detail.status_to_open
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

	def qualification_params
		params.require(:qualification).permit(
		  :comment, :refered_by, :reference_name, :contact_mode, :data_entry_responsible, :status
		)
	end
end
