class MessageMailer < ActionMailer::Base

	default from: "<reyes@nortonrecords.com>"
	default to: "<reyesorodriguez@gmail.com>"

	def new_message(message)
		@message = message
		mail subject: "Message from #{message.name}"
	end
end
