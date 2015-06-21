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
  # remove the AusPost prefix
  klass = klass.to_s.gsub(/AusPost::/, '')

  # convert the first module in the namespace. In some cases it is acronym and
  # doesn't conform to the conversion steps below
  method_prefix = klass.match(/.*::/)[0].gsub(/::/, '').downcase

  # remove the first module in the name space, convert camel case to
  # underscores, then add the method prefix back
  method_prefix + "_" + klass
    .to_s
    .gsub(/.*::/, '')
    .split(/(?=[A-Z])/)
    .map(&:downcase)
    .join('_')
end

describe AusPost do
  describe "#pac_domestic_postcode_search" do
    it_behaves_like 'an api call', AusPost::PAC::DomesticPostcodeSearch
  end

  describe "#pac_country" do
    it_behaves_like 'an api call', AusPost::PAC::Country
  end

  describe "#pac_domestic_letter_thickness" do
    it_behaves_like 'an api call', AusPost::PAC::DomesticLetterThickness
  end

  describe "#pac_domestic_letter_weight" do
    it_behaves_like 'an api call', AusPost::PAC::DomesticLetterWeight
  end

  describe "#pac_domestic_letter_size" do
    it_behaves_like 'an api call', AusPost::PAC::DomesticLetterSize
  end

  describe "#pac_postage_parcel_domestic_service" do
    it_behaves_like 'an api call', AusPost::PAC::PostageParcelDomesticService
  end

  describe "#pac_postage_parcel_international_service" do
    it_behaves_like 'an api call', AusPost::PAC::PostageParcelInternationalService
  end

  describe "#pac_postage_parcel_domestic_calculate" do
    it_behaves_like 'an api call', AusPost::PAC::PostageParcelDomesticCalculate
  end

  describe "#pac_postage_parcel_international_calculate" do
    it_behaves_like 'an api call', AusPost::PAC::PostageParcelInternationalCalculate
  end
end
