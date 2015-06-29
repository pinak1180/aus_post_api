require 'spec_helper'

describe AusPostAPI::PAC::DomesticPostcodeSearch do
  let(:required_attributes) do
    {
      q: 'Melbourne'
    }
  end
  let(:optional_attributes) do
    {
      state: 'VIC',
      excludepostboxflag: 'true'
    }
  end

  it_behaves_like 'an endpoint'
end
