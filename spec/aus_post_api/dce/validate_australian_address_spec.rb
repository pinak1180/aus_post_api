require 'spec_helper'

describe AusPostAPI::DCE::ValidateAustralianAddress do
  skip "There are no test credentials for this endpoint" do
    let(:required_attributes) {
      {
        addressline1: '111',
        suburb:       "Melbourne",
        postcode:     "3000",
        state:        "VIC",
        country:      "AU"
      }
    }
    let(:optional_attributes) { { addressline2: 'Bourke St' } }

    it_behaves_like 'an endpoint'
  end
end
