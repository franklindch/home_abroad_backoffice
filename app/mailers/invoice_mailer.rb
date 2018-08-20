class InvoiceMailer < ApplicationMailer
	before_action { @invoices = params[:invoice] }

		default to: -> { User.first },
		        from:  -> { 'notifications@example.com' }

		def send_delayed_payment
	    mail(subject: "Voici un récapitulatif Jeanne des facture pour le séjou")
		end
end
