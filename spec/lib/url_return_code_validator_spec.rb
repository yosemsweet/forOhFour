require 'spec_helper'
require 'lib/url_return_code_validator'

class Code200Page < Page
	validates :url, :url_return_code => {:status => 200}
end

class Code404Page < Page
	validate :url, :url_return_code => { :status => 404}
end


describe 'UrlReturnCodeValidator' do

	it "should be a validation" do
		UrlReturnCodeValidator.method_defined?(:validate_each).should == true
	end
	
	context "with 200 codes" do
	
		it "should pass with a url return 200 code" do
			testPage = Code200Page.new({:url => 'http://localhost:3000/'})
			puts testPage.errors
			
			testPage.should be_valid

		end
	end
	
	
end