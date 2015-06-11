require_relative '../lib/api'

describe API do
  describe "Including the API module in a class" do
    it 'must define a REQUIRED_ATTRS const' do
      expect {
        NoRequiredAttrsConstSet.new.class.send(:include, API)
      }.to raise_error(API::ImplementationError)
    end

    it 'must define a OPTIONAL_ATTRS const' do
      expect {
        NoOptionalAttrsConstSet.new.class.send(:include, API)
      }.to raise_error(API::ImplementationError)
    end
  end
end

class NoOptionalAttrsConstSet; REQUIRED_ATTRS = []; end
class NoRequiredAttrsConstSet; OPTIONAL_ATTRS = []; end
