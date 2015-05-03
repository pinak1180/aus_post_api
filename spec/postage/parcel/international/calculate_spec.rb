require 'spec_helper'

describe Postage::Parcel::International::Calculate do
  let(:required_attributes) do
    {
      country_code:  'NZ',
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
  let(:api_uri) { "postage/parcel/international/calculate" }

  it_behaves_like 'an api'
end
