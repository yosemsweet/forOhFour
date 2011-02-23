RSpec::Matchers.define :validate_with_404_return_code do |attribute|
	match do |model|
    model.class.validators_on(attribute).find( UrlReturnCodeValidator.new({:options => {:status=>404}, :attributes=>[:url]}) )
  end
end
