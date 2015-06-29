require 'spec_helper'

describe AusPostAPI::PAC::PostageParcelDomesticCalculate do
  let(:required_attributes) do
    {
      from_postcode: '2000',
      to_postcode:   '3000',
      length:        '10',
      width:         '10',
      height:        '10',
      weight:        '10',
      service_code:  'AUS_PARCEL_REGULAR'
    }
  end
  let(:optional_attributes) do
    {
      option_code:    'AUS_SERVICE_OPTION_SIGNATURE_ON_DELIVERY',
      suboption_code: 'AUS_SERVICE_OPTION_EXTRA_COVER',
      extra_cover:    100
    }
  end

  it_behaves_like 'an endpoint'
end
