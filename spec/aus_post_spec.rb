require 'spec_helper'

RSpec.shared_examples_for "an api call" do |wrapped_api_class|
  let(:api_instance) { instance_double(wrapped_api_class) }
  let(:api_method)   { convert_class_to_method(wrapped_api_class) }
  let(:config)       { { test: true, format: AusPost::API::VALID_FORMATS.sample } }
  let(:params)       { {} }

  it "should call execute on the appropriate api class" do
    expect(wrapped_api_class).to receive(:new).with(params, config) { api_instance }
    expect(api_instance).to      receive(:execute)

    AusPost.new(config).send(api_method, params)
  end
end

def convert_class_to_method(klass)
  klass
    .to_s
    .gsub(/AusPost::PAC::/, '')
    .split(/(?=[A-Z])/)
    .map(&:downcase)
    .join('_')
    .to_sym
end

describe AusPost do
  describe "#domestic_postcode_search" do
    it_behaves_like 'an api call', AusPost::PAC::DomesticPostcodeSearch
  end

  describe "#country" do
    it_behaves_like 'an api call', AusPost::PAC::Country
  end

  describe "#domestic_letter_thickness" do
    it_behaves_like 'an api call', AusPost::PAC::DomesticLetterThickness
  end

  describe "#domestic_letter_weight" do
    it_behaves_like 'an api call', AusPost::PAC::DomesticLetterWeight
  end

  describe "#domestic_letter_size" do
    it_behaves_like 'an api call', AusPost::PAC::DomesticLetterSize
  end

  describe "#postage_parcel_domestic_service" do
    it_behaves_like 'an api call', AusPost::PAC::PostageParcelDomesticService
  end

  describe "#postage_parcel_international_service" do
    it_behaves_like 'an api call', AusPost::PAC::PostageParcelInternationalService
  end

  describe "#postage_parcel_domestic_calculate" do
    it_behaves_like 'an api call', AusPost::PAC::PostageParcelDomesticCalculate
  end

  describe "#postage_parcel_international_calculate" do
    it_behaves_like 'an api call', AusPost::PAC::PostageParcelInternationalCalculate
  end
end
