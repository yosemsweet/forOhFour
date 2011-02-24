require 'lib/url_return_code_validator'

class Page < ActiveRecord::Base
	validates :url, :url_return_code => { :status => 404}
end
