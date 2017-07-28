class OrderMailer < ApplicationMailer
		default from: 'joehanson902@gmail.com'

	def admin_email(email, subject, body)
		mail(to: email, subject: subject, body: body)
	end
end
