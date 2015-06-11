require 'spec_helper'

describe Postage::Parcel::International::Service do
  let(:required_attributes) { { country_code: 'NZ', weight: '10' } }
  let(:optional_attributes) { {} }
  let(:uri)                 { "postage/parcel/international/service" }

  it_behaves_like 'an api'
end
