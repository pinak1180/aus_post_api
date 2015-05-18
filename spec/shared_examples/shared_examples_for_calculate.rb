RSpec.shared_examples 'a shipping calculator api' do
  subject { described_class }

  let(:attributes) { required_attributes.merge(optional_attributes) }

  let(:invalid_service_code_attributes) do
    attributes.merge(service_code: 'NOT_EVEN_A_REAL_SERVICE_CODE')
  end

  describe "service code", :vcr do
    it "should raise a service code error if an invalid service code is used" do
      expect {
        subject.new(invalid_service_code_attributes, json_config).execute
      }.to raise_error(API::InvalidServiceCodeError)
    end
  end
end
