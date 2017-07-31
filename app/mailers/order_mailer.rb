class OrderMailer < ApplicationMailer
		default from: 'preorderfactory@gmail.com'

	def admin_email(email, subject, body)
		mail(to: email, subject: subject, body: body)
	end
end
