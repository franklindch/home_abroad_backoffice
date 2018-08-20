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
      format.html
      format.pdf do
        render pdf: "enrollment_form_client_#{language_stay.client.first_name}_séjour_#{language_stay.duration}",
               template: 'language_stays/enrollment_form.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end

  def generate_invoice_pdf(invoice)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{invoice.family.name}",
               template: 'invoices/invoice.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end

  def generate_paid_invoice_pdf(invoice)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{invoice.family.name}",
               template: 'invoices/invoice.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end

  def generate_airport_convocation_pdf(travel)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{travel.travel_code}",
               template: 'travels/airport_convocation.html.slim',
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end
end
