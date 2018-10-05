class FamiliesController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_family, only: [:edit, :update, :destroy, :show]

  def new
    # ClientMailer.with(language_stay: LanguageStay.first, client: LanguageStay.first.client).send_language_stay_feedback.deliver_now
    @family = Family.new
    @qualification = Qualification.new
  end

  def create
    @family = Family.new(family_params)

    if @family.save
      flash[:notice] = "Famille ajoutée avec succès !"
      redirect_to family_qualification_path(@family)
    else
      render :new
    end
  end

  def edit; end

  def update
    @family.update(family_params)
    flash[:notice] = "Famille édité avec succès !"
    redirect_to families_path
  end

  def destroy
    @family.destroy
    flash[:notice] = "Famille supprimée avec succès !"
    redirect_to families_path
  end

  def index
    @families = Family.none
    respond_to do |format|
      format.html
      format.js
    end
    search_families
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@family.name}",
               template: 'pdf/invoice.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end

  private

  def search_families
    if params[:query].present?
      @families = Family.search_by_name(params[:query]).page(params[:query])
    else
      @families = Family.none
    end
  end

  def retrieve_family
    @family ||= Family.find(params[:id])
  end

  def family_params
    params.require(:family).permit(
      :mother_main_contact, :father_main_contact, :country, :prospect, :father_office_phone, :father_office_intl_number, :mother_office_intl_number, :intl_number, :name, :family_situation, :mother_office_phone, :father_office_phone, :father_first_name, :mother_first_name, :father_intl_number, :mother_intl_number, :address_1, :address_2, :zip_code, :phone, :email, :qualification_id, :father_name, :mother_name, :father_phone, :mother_phone, :father_email, :mother_email
    )
  end
end
