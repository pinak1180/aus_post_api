require 'spec_helper'

describe Postage::Parcel::Domestic::Service do
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
  let(:api_uri)             { "postage/parcel/domestic/service" }

  it_behaves_like 'an api'
  it_behaves_like 'a domestic parcel api'
end
