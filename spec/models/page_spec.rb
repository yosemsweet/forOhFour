require 'spec_helper'

describe Page do
  it "should have a url" do
		p  = Page.new
		p.should respond_to(:url)
	end
end
