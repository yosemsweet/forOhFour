require 'net/http'

class UrlReturnCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
		uri = URI.parse("http://www.google.ca/")

		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Get.new(uri.request_uri)

		response = http.request(request)
		
		errors = record.errors[attribute] << "URL must return #{options[:status]} - returned #{response.code}" unless response.code.to_i == options[:status]
		puts errors
		puts response.code
		puts value
		puts attribute
		puts options[:status]
		errors
  end
end