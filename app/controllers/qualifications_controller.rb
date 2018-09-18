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
		  @family.update_columns(qualification_id: @qualification.id)
      if @qualification.prospect?
        flash[:notice] = "Merci de remplir les informations du prospect."
        redirect_to new_qualification_child_detail_path(@qualification)
      else
        flash[:notice] = "Vous pouvez toujours ajouter des prospects à la famille ajoutée."
        redirect_to families_path
      end
	  else
      flash[:alert] = "Veuillez compléter les champs obligatoires."
      render :new
    end
  end

  def close_prospect
    @child_detail = ChildDetail.find(params[:child_detail])
    @child_detail.status_to_close
    respond_to do |format|
      format.html
      format.js { render :js => "window.location = '/dashboard/families'" }
    end
    flash[:alert] = "Prospect correctement clôturé."
  end

  def reestablish_prospect
    @child_detail = ChildDetail.find(params[:child_detail])
    @child_detail.status_to_open
    respond_to do |format|
      format.html
      format.js { render :js => "window.location = '/dashboard/families'" }
    end
		flash[:notice] = "Prospect correctement rétabli."
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
		  :comment, :refered_by, :reference_name, :contact_mode, :data_entry_responsible, :prospect
		)
	end
end
