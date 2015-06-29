require 'spec_helper'

describe AusPostAPI::PAC::PostageLetterDomesticService do
  let(:required_attributes) {
    {
      length:    100,
      width:     100,
      thickness: 20,
      weight:    100
    }
  }
  let(:optional_attributes) { {} }

  it_behaves_like 'an endpoint'
end
