require 'spec_helper'

describe Postage::Parcel::International do
  let(:attributes) do
    {
      country_code:  'NZ',
      weight:        '10'
    }
  end
  let(:api_uri) { "postage/parcel/international/service" }

  it_behaves_like 'an api'
end
