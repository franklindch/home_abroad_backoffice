class LanguageStaysController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_client, only: [:new, :edit, :update, :destroy, :create]
	before_action :retrieve_language_stay, only: [:edit, :update, :destroy]
  respond_to :docx

  def new
    @language_stay = LanguageStay.new
  end

  def create
    @language_stay = LanguageStay.new(language_stay_params)
    @language_stay.client = @client
    if @language_stay.save
      # result = @language_stay.get_duration
      # @language_stay.update_columns(duration: result)
      flash[:notice] = "Séjour ajouté avec succès !"
      redirect_to client_path(@client)
    else
      flash[:alert] = 'Merci de lire les messages d\'erreur'
      render :new
    end
  end

  def send_confirmation
    @language_stay = LanguageStay.find(params[:language_stay])
    @language_stay.update_columns(confirmation_language_stay: true, confirmation_language_stay_date: Date.today)
    respond_to do |format|
      format.html
      format.js { render :js => "window.location = '/dashboard/language_stays'" }
    end
  end

  def cancel_confirmation
    @language_stay = LanguageStay.find(params[:language_stay])
    @language_stay.update_columns(confirmation_language_stay: false)
    respond_to do |format|
      format.html
      format.js { render :js => "window.location = '/dashboard/language_stays'" }
    end
  end

  def edit; end

  def update
    @language_stay.update(language_stay_params)
    # result = @language_stay.get_duration
    # raise
    # @language_stay.update_columns(duration: result)
    flash[:notice] = 'Séjour édité avec succès !'
    redirect_to client_path(@client)
  end

  def destroy
    @language_stay.destroy
    flash[:notice] = 'Séjour supprimé avec succès !'
    redirect_to client_path(@client)
  end

  def enrollment_form
    @language_stay = LanguageStay.find(params[:language_stay])
    generate_enrollment_form_pdf(@language_stay)
    fields_filled(@language_stay)
  end

  def certificate
    @language_stay = LanguageStay.find(params[:language_stay])
    generate_language_stay_certificate_word(@language_stay)
  end

  def cancel_language_stay
    @language_stay = LanguageStay.find(params[:language_stay])
    @language_stay.cancel
    respond_to do |format|
      format.html
      format.js { render :js => "window.location = '/dashboard/clients/#{@language_stay.client.id}'" }
    end
    flash[:alert] = 'Séjour correctement annulé.'
  end

  def incomplete_files
    @incomplete_files = LanguageStay.incomplete_files
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @language_stays = LanguageStay.ordered_by_end_date
    respond_to do |format|
      format.html
      format.js
    end
  end

  def reestablish_language_stay
    @language_stay = LanguageStay.find(params[:language_stay])
    @language_stay.reestablish
    respond_to do |format|
      format.html
      format.js { render :js => "window.location = '/dashboard/clients/#{@language_stay.client.id}'" }
    end
    flash[:notice] = 'Séjour correctement rétabli.'
  end

  private

  def fields_filled(language_stay)
    if language_stay.all_attributes?
      flash[:notice] = 'Tous les champs du séjour ont été remplis'
    else
      flash[:alert] = 'Il reste sûrement des informations à compléter sur le séjour'
    end
  end

  def retrieve_client
    @client ||= Client.find(params[:client_id])
  end

  def retrieve_language_stay
    @language_stay ||= LanguageStay.find(params[:id])
  end

  def language_stay_params
    params.require(:language_stay).permit(:picture,
      :flight, :visa, :confirmation_language_stay_date,
      :passport_cni, :family_file, :school_notes,
      :language_test, :junior_waiver, :medical_form, :english_cv,
      :motivation_letter, :agreement_welcome_school, :justice_record, :rules_and_regulations,
      :teacher_reference, :other_pension, :other_transfer, :option_3, :option_3_fr, :option_1_fr, :option_2_fr, :program_detail_fr, :program_detail, :accomodation_type, :transfer_aller, :transfer_retour, :room, :data_entry_responsible, :commercial_responsible, :precisions, :duration, :fee, :travel_id, :program_id, :start_date, :end_date, :city, :country, :pension, :accomodation, :option_1, :option_2, :class_hours,:partner_company_id, :client_id, :invoice_id)
  end

  def date_format(language_stay_params, date)
    {
      day: language_stay_params["#{date}(3i)"].to_i,
      month: language_stay_params["#{date}(2i)"].to_i,
      year: language_stay_params["#{date}(1i)"].to_i
    }
  end

  def generate_language_stay_certificate_word(language_stay)
    respond_to do |format|
      format.docx do
        render docx: 'generate_language_stay_certificate_word', filename: "#{language_stay.client.last_name.upcase} #{language_stay.client.first_name}_Attestation_séjour.docx"
      end
    end
  end
end
