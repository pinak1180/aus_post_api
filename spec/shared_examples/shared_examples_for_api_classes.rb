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

  describe "Initializing the class" do
    context "required attributes" do
      described_class::REQUIRED_ATTRS.each do |attr|
        it "should raise a required argument error if #{attr} is not given" do
          attributes.delete(attr)
          expect { subject.new(attributes, config) }.to raise_error(
            API::RequiredArgumentError
          )
        end
      end
    end

    context "optional attributes" do
      described_class::OPTIONAL_ATTRS.each do |attr|
        it "should not raise a required argument error if #{attr} is not given" do
          optional_attributes.delete(attr)
          expect { subject.new(attributes, config) }.to_not raise_error
        end
      end
    end
  end
end