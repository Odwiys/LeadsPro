require 'net/http'
require 'json'

url = URI.parse('https://api.sendinblue.com/v3/smtp/email')
api_key = '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'

sender = {
	"name": "lead",
	"email": "sabrinaleess6@gmail.com"
}

to = ['sabrinaleess6@gmail.com'].map { |email| { "email": email } }

data = {
  "sender": sender,
  "to": to,
  "htmlContent": ":()",
  "subject": ">:()",
  "replyTo": {
    "email": "sabrinaleess6@gmail.com",
    "name": "AAAAA"
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
request.body = data.to_json

response = http.request(request)

if response.code.to_i < 400
  # Successful request
  puts "Email sent successfully!"
else
  # Error occurred
  puts "SENDINBLUE ERROR: #{response.body}"
end