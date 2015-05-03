RSpec.shared_examples 'an api' do
  subject { described_class }

  let(:attributes) { required_attributes.merge(optional_attributes) }

  describe "#api_uri" do
    context "the specified format is json" do
      it "should return the json api uri" do
        expect(subject.new(attributes, json_config).api_uri).to eql(
          api_uri + ".json"
        )
      end
    end

    context "the specified format is xml" do
      it "should return the xml api uri" do
        expect(subject.new(attributes, xml_config).api_uri).to eql(
          api_uri + ".xml"
        )
      end
    end
  end

  describe "#execute", :vcr do
    it "should call the api endpoint" do
      expect(subject.new(attributes, json_config).execute).to_not eql(nil)
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
