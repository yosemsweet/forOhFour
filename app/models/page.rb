class Page < ActiveRecord::Base
	validates :url, :url_return_code => { :status => 404}
end
