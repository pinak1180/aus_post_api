require 'spec_helper'

describe AusPost::PAC::PostageParcelDomesticService do
  let(:required_attributes) do
    {
      from_postcode: '2000',
      to_postcode:   '3000',
      length:        '10',
      width:         '10',
      height:        '10',
      weight:        '10'
    }
  end
  let(:optional_attributes) { {} }

  it_behaves_like 'an api'
end
