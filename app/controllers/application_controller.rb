require "application_responder"

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include ActionController::MimeResponds

  def after_sign_in_path_for(resource)
    families_path
  end

    def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :job_description])
  end

  def generate_enrollment_form_pdf(language_stay)
    respond_to do |format|
      format.html do
        render pdf: "#{language_stay.client.family.name} #{language_stay.client.first_name}_Enrollment_Form",
               template: 'pdfs/enrollment_form.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end

  def generate_invoice_pdf(invoice)
    respond_to do |format|
      format.html do
        render pdf: "#{invoice.language_stay.client.family.name} #{invoice.language_stay.client.first_name}_Facture",
               template: 'pdfs/invoice.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end

  def generate_paid_invoice_pdf(invoice)
    respond_to do |format|
      format.html do
        render pdf: "#{invoice.language_stay.client.family.name} #{invoice.language_stay.client.first_name}_Facture_acquittée",
               template: 'pdfs/paid_invoice.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end

  def generate_airport_convocation_pdf(travel)
    respond_to do |format|
      format.html do
        render pdf: "Convocation_#{travel.travel_code}",
               template: 'pdfs/airport_convocation.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end
end
