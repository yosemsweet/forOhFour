require 'spec_helper'

describe Page do
  it "should have a url" do
		p = Page.new
		p.should respond_to(:url)
	end
	
	it "should have a description" do
		p = Page.new
		p.should respond_to(:description)
	end
	
	it "should validate url returns a 404 status" do
		p = Page.new
		p.should validate_with_404_return_code(:url)
	end
end
