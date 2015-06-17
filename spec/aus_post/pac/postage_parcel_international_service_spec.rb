require 'spec_helper'

describe AusPost::PAC::PostageParcelInternationalService do
  let(:required_attributes) { { country_code: 'NZ', weight: '10' } }
  let(:optional_attributes) { {} }

  it_behaves_like 'an api'
end
