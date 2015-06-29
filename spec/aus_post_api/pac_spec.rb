require 'spec_helper'

RSpec.shared_examples_for "a PAC endpoint wrapper" do |wrapped_api_class|
  let(:api_instance) { instance_double(wrapped_api_class) }
  let(:api_method)   { convert_class_to_method(wrapped_api_class) }
  let(:params)       { { test: :param } }
  let(:config)       { { test: :config } }

  it "should call execute on the appropriate api class" do
    expect(wrapped_api_class).to receive(:new).with(params, config) { api_instance }
    expect(api_instance).to      receive(:execute)

    AusPostAPI::PAC.new(config).send(api_method, params)
  end
end

def convert_class_to_method(klass)
  klass = klass.to_s.gsub(/AusPostAPI::PAC/, '')

  # underscores -> camel case
  klass
    .to_s
    .gsub(/.*::/, '')
    .split(/(?=[A-Z])/)
    .map(&:downcase)
    .join('_')
end

describe AusPostAPI::PAC do
  describe "#pac_domestic_postcode_search" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::DomesticPostcodeSearch
  end

  describe "#pac_country" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::Country
  end

  describe "#pac_domestic_letter_thickness" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::DomesticLetterThickness
  end

  describe "#pac_domestic_letter_weight" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::DomesticLetterWeight
  end

  describe "#pac_domestic_letter_size" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::DomesticLetterSize
  end

  describe "#pac_international_letter_weight" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::InternationalLetterWeight
  end

  describe "#pac_international_parcel_weight" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::InternationalParcelWeight
  end

  describe "#pac_domestic_parcel_weight" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::DomesticParcelWeight
  end

  describe "#pac_domestic_parcel_type" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::DomesticParcelType
  end

  describe "#pac_domestic_parcel_size" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::DomesticParcelSize
  end

  describe "#pac_postage_letter_domestic_service" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::PostageLetterDomesticService
  end

  describe "#pac_postage_parcel_domestic_service" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::PostageParcelDomesticService
  end

  describe "#pac_postage_letter_international_service" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::PostageLetterInternationalService
  end

  describe "#pac_postage_parcel_international_service" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::PostageParcelInternationalService
  end

  describe "#pac_postage_parcel_domestic_calculate" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::PostageParcelDomesticCalculate
  end

  describe "#pac_postage_parcel_international_calculate" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::PostageParcelInternationalCalculate
  end

  describe "#pac_postage_letter_domestic_calculate" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::PostageLetterDomesticCalculate
  end

  describe "#pac_postage_letter_international_calculate" do
    it_behaves_like 'a PAC endpoint wrapper', AusPostAPI::PAC::PostageLetterInternationalCalculate
  end
end
