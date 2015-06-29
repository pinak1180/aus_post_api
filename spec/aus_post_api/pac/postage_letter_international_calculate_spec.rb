require 'spec_helper'

describe AusPostAPI::PAC::PostageLetterInternationalCalculate do
  let(:required_attributes) {
    {
      country_code: 'NZ',
      service_code: 'INTL_SERVICE_AIR_MAIL'
    }
  }
  let(:optional_attributes) {
    {
      weight:         100,
      option_code:    'INTL_SERVICE_OPTION_EXTRA_COVER',
      suboption_code: 'INTL_SERVICE_OPTION_CONFIRM_DELIVERY',
      extra_cover:    1000,
    }
  }

  it_behaves_like 'an endpoint'
end
