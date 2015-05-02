require 'spec_helper'

describe Postage::Parcel::Domestic do
  let(:attributes) do
    {
      from_postcode: '2000',
      to_postcode:   '3000',
      length:        '10',
      width:         '10',
      height:        '10',
      weight:        '10'
    }
  end
  let(:api_uri) { "postage/parcel/domestic/service" }

  it_behaves_like 'an api'
end
