class SendEmailController < ApplicationController
  def send_email
		require 'net/http'
		require 'json'

		url = URI.parse('https://api.sendinblue.com/v3/smtp/email')
		api_key = ENV['BREVO_KEY']

		# get list of ids
		lead_ids = []
		params.each do |key, value|
			lead_ids << value.to_i if key.include?('email') && value != ''
		end

		leads = Lead.where(id: lead_ids)

		leads.each do |lead|
			name_content = "Dear #{lead.name}"
			name_content = name_content.delete('[]')

			sender = {
				"name": "name",
				"email": "sabrinaleess6@gmail.com"
			}

			to = ['sabrinaleess6@gmail.com'].map { |email| { "email": email } }

			textarea_content = params[:textarea]

			data = {
				"sender": sender,
				"to": to,
				"htmlContent": textarea_content,
				"subject": name_content,
				"replyTo": {
					"email": "sabrinaleess6@gmail.com",
					"name": "name"
				}
			}

			headers = {
				'Accept': 'application/json',
				'Content-Type': 'application/json',
				'api-key': api_key
			}

			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = true

			request = Net::HTTP::Post.new(url.path, headers)
			puts data
			request.body = data.to_json

			response = http.request(request)

			if response.code.to_i < 400
				# Successful request
				puts "Email sent successfully!"
			else
				# Error occurred
				puts "SENDINBLUE ERROR: #{response.body}"
			end
		end
	end
end
