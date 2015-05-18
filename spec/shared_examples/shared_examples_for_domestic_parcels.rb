RSpec.shared_examples 'a domestic parcel api' do
  subject { described_class }

  let(:attributes) { required_attributes.merge(optional_attributes) }

  let(:invalid_dimension_attributes) do
    attributes.merge(optional_attributes).merge(
      height: "#{MAX_DIMENSION + 1}",
      width:  "#{MAX_DIMENSION + 1}",
      length: "#{MAX_DIMENSION + 1}"
    )
  end

  describe "#execute", :vcr do
    it "should raise an error if a dimension is too large" do
      expect {
        subject.new(invalid_dimension_attributes, json_config).execute
      }.to raise_error(API::InvalidDimensionError)
    end
  end
end
