require 'spec_helper'

describe Postage::Parcel::International::Service do
  let(:required_attributes) do
    {
      country_code:  'NZ',
      weight:        '10'
    }
  end
  let(:optional_attributes) { {} }
  let(:api_uri) { "postage/parcel/international/service" }

  it_behaves_like 'an api'
end
