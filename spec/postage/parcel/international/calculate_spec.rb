require 'spec_helper'

describe Postage::Parcel::International::Calculate do
  let(:required_attributes) do
    {
      country_code:  'NZ',
      weight:        '10',
      service_code:  'INTL_SERVICE_EPI'
    }
  end

  # TODO: find valid optional attributes
  let(:optional_attributes) do
    {}
  end
  let(:api_uri) { "postage/parcel/international/calculate" }

  it_behaves_like 'an api'
end
