RSpec.shared_examples 'an api' do
  subject { described_class }

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

  context "required attributes are not provided" do
    described_class::ATTRS.each do |attr|
      it "should raise a required argument error if #{attr} is not given" do
        attributes.delete(attr)
        expect { subject.new(attributes, config) }.to raise_error(
          API::RequiredArgumentError
        )
      end
    end
  end
end
