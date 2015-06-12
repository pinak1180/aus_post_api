RSpec.shared_examples 'an api' do
  subject { described_class }

  let(:attributes) { required_attributes.merge(optional_attributes) }

  describe "#execute", :vcr do
    it "should call the api endpoint" do
      response = JSON.parse(subject.new(attributes, json_config).execute.body)
      expect(response).to_not      eql(nil)
      expect(response["error"]).to eql(nil)
    end
  end

  describe "Validating config options" do
    let(:valid_test_config) {
      { test: true, format: API::VALID_FORMATS.sample, auth_key: '123' }
    }

    describe "Setting an Auth Key" do
      context "the test configuration is set to true" do
        it "should not raise an error if no auth key is provided" do
          valid_test_config.delete(:auth_key)

          expect {
            described_class.new(
              required_attributes, valid_test_config.merge(test: true)
            )
          }.to_not raise_error
        end
      end

      context "the test configuration is set to false" do
        it "should raise an error if no auth key is provided" do
          valid_test_config.delete(:auth_key)

          expect {
            described_class.new(
              required_attributes, valid_test_config.merge(test: false)
            )
          }.to raise_error(
            API::NoAuthKeyProvidedError
          )
        end
      end
    end

    describe "Setting a format" do
      context "no format is provided" do
        it "should raise an error" do
          valid_test_config.delete(:format)

          expect { described_class.new({}, valid_test_config) }.to raise_error(
            API::NoFormatProvidedError
          )
        end
      end

      context "an invalid format is provided" do
        it "should raise an error" do
          expect {
            described_class.new({}, valid_test_config.merge(format: 'not valid'))
          }.to raise_error(
            API::InvalidFormatError
          )
        end
      end
    end
  end

  describe "Setting attributes" do
    context "required attributes" do
      described_class::REQUIRED_ATTRS.each do |attr|
        it "should raise a required argument error if #{attr} is not given" do
          attributes.delete(attr)
          expect { subject.new(attributes, json_config) }.to raise_error(
            API::RequiredArgumentError
          )
        end
      end
    end

    context "optional attributes" do
      described_class::OPTIONAL_ATTRS.each do |attr|
        it "should not raise a required argument error if #{attr} is not given" do
          optional_attributes.delete(attr)
          expect {
            subject.new(attributes.merge(optional_attributes), json_config)
          }.to_not raise_error
        end
      end
    end
  end
end
