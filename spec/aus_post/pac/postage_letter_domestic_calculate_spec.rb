require 'spec_helper'

describe AusPost::PAC::PostageLetterDomesticCalculate do
  let(:required_attributes) {
    {
      service_code: 'AUS_LETTER_REGULAR_LARGE',
      weight:       100
    }
  }
  let(:optional_attributes) {
    {
      option_code:    'AUS_SERVICE_OPTION_REGISTERED_POST',
      suboption_code: 'AUS_SERVICE_OPTION_DELIVERY_CONFIRMATION',
      extra_cover:     1000,
    }
  }

  it_behaves_like 'an api'
end
