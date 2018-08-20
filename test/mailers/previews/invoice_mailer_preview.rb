# Preview all emails at http://localhost:3000/rails/mailers/invoice_mailer
class InvoiceMailerPreview < ActionMailer::Preview
	def send_delayed_payment
		invoices = Invoice.all
		InvoiceMailer.with(invoices: invoices).send_delayed_payment
	end

end
