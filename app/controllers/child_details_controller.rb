class ChildDetailsController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_child_detail, only: [:edit, :update, :destroy, :show]
	before_action :retrieve_qualification, only: [:new, :edit, :update, :destroy, :show, :create]
  before_action :retrieve_partner_companies, only: [:create, :update]

  def new
    @family = @qualification.family
    @child_detail = ChildDetail.new(
      last_name: @family.name
    )
  end

  def edit; end

  def destroy
    @child_detail.destroy
    flash[:notice] = "Prospect supprimé avec succès !"
    redirect_to families_path
  end

  def create
    binding.pry
    @child_detail = ChildDetail.new(child_detail_params)
    @child_detail.qualification = @qualification
    if @child_detail.save
      flash[:notice] = "Prospect créé avec succès !"
      @child_detail.update(partner_company_ids: @partner_companies)
      redirect_to families_path
    else
      render :new
    end
  end

  def update
    if @child_detail.update(child_detail_params)
      flash[:notice] = "Prospect édité avec succès !"
      redirect_to families_path
    else
      flash[:notice] = "Merci de lire les messages d'erreurs."
      render :edit
    end
  end

	private

	def retrieve_qualification
	  @qualification = Qualification.find(params[:qualification_id])
	end

  def retrieve_child_detail
    @child_detail = ChildDetail.find(params[:id])
  end

  def child_detail_params
    params.require(:child_detail).permit(
      :partner_company_ids, :first_name, :last_name, :age, :comment, :qualification_id, :email, :gender, :school_grade, :school, :duration, :month, :status
    )
  end

  def retrieve_partner_companies
    @partner_companies ||= params[:child_detail][:partner_company_ids].delete_if {|id| id == ""}
  end
end
