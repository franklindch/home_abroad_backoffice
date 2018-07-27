class FamiliesController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_family, only: [:edit, :update, :destroy, :show]

  def new
    @family = Family.new
    @qualification = Qualification.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      # FamilyMailer.with(family: @family).welcome_email.deliver_now
      redirect_to family_qualification_path(@family)
      flash[:alert] = "Cet établissement ne semble pas être un bar ou restaurant, ou l'établissement est peut-être définitivement fermé. Veuillez en entrer un autre"
    else
      render :new
    end
  end

  def edit; end

  def update
    @family.update(family_params)
    redirect_to families_path
  end

  def destroy
    @family.destroy
    redirect_to families_path
  end

  def index
    @families = Family.order(:name).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
    
    if params[:query].present?
      @families = Family.search_by_name(params[:query]).page(params[:query])
    else
      @families = Family.order(:name).page params[:page]
    end
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

  def inscription_details
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "inscription_details",
               template: 'pdf/inscription_details.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end

  private

  def family_invoice
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     render pdf: "#{@family.name}",
    #            template: 'pdf/family_pdf.html.slim',
    #            disposition: 'attachment',
    #            layout: 'pdf'
    #   end
    # end
  end

  def retrieve_family
    @family ||= Family.find(params[:id])
  end

  def family_params
    params.require(:family).permit(
      :name, :family_situation, :address_1, :address_2, :zip_code, :phone, :email, :city, :qualification_id
    )    
  end
end
