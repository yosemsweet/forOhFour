require 'spec_helper'
require 'lib/url_return_code_validator'

class Code200Page < Page
	validates :url, :url_return_code => {:status => 200}
end

class Code404Page < Page
	validates :url, :url_return_code => { :status => 404}
end


describe 'UrlReturnCodeValidator' do

	it "should be a validation" do
		UrlReturnCodeValidator.method_defined?(:validate_each).should == true
	end
	
	context "with 200 codes" do
	
		it "should pass with a url returning a 200 code" do
			testPage = Code200Page.new({:url => 'http://localhost:3000/'})
			testPage.should be_valid
		end
		
		context "with edge cases" do
			it "should fail with a 404 page" do
				testPage = Code200Page.new({:url => 'http://localhost:3000/SDKAJSBFASDAKJSD/Invalid.html'})
				testPage.should be_invalid
			end
			 
			it "should fail with a nonexistant domain" do
				testPage = Code200Page.new({:url => 'http://invalidurl/'})
				testPage.should be_invalid
			end
		end
	end
	
	context "with 404 codes" do
	
		it "should pass with a url returning a 404 code" do
			testPage = Code404Page.new({:url => 'http://localhost:3000/SDKAJSBFASDAKJSD/Invalid.html'})
			testPage.should be_valid
		end
		
		context "with edge cases" do
			it "should fail with a url returning 200 code" do
				testPage = Code404Page.new({:url => 'http://localhost:3000/'})
				testPage.should be_invalid
			end
			 
			it "should fail with a nonexistant domain" do
				testPage = Code404Page.new({:url => 'http://invalidurl/'})
				testPage.should be_invalid
			end
		end
	end
end