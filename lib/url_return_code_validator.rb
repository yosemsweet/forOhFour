require 'net/http'

class UrlReturnCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
		# puts "Validating #{value} returns #{options[:status]}"
		
		begin
			uri = URI.parse(value)

			http = Net::HTTP.new(uri.host, uri.port)
			request = Net::HTTP::Get.new(uri.request_uri)

			response = http.request(request)
			status = response.code.to_i

			# puts response
		rescue
			status = -1
		end
		record.errors[attribute] << "URL must return #{options[:status]} - returned #{status}" unless status == options[:status]
		
			# puts '----------'
			# puts record.errors
			# puts status
			# puts value
			# puts attribute
			# puts options[:status]
			# puts '----------'

		record.errors
  end
end