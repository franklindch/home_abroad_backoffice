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

  def generate_enrollment_form_pdf(language_stay)
    respond_to do |format|
      format.html do
        render pdf: "#{language_stay.client.first_name} #{language_stay.client.family.name}_Application_Form",
               template: 'pdfs/enrollment_form.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end

  def generate_language_stay_certificate_pdf(language_stay)
    respond_to do |format|
      format.html do
        render pdf: "Certificat #{language_stay.client.first_name} #{language_stay.client.family.name}_Application_Form",
               template: 'pdfs/language_stay_certificate.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end
  
  def generate_invoice_pdf(invoice)
    respond_to do |format|
      format.html do
        render pdf: "#{invoice.language_stay.client.first_name} #{invoice.language_stay.client.family.name}_Facture",
               template: 'pdfs/invoice.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end

  def generate_paid_invoice_pdf(invoice)
    respond_to do |format|
      format.html do
        render pdf: "#{invoice.language_stay.client.family.name}",
               template: 'pdfs/paid_invoice.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end

  def generate_airport_convocation_pdf(travel)
    respond_to do |format|
      format.html do
        render pdf: "#{travel.travel_code}",
               template: 'pdfs/airport_convocation.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end
end
