require 'spec_helper'

RSpec.shared_examples_for "an api call" do |wrapped_api_class|
  let(:api_instance) { instance_double(wrapped_api_class) }
  let(:api_method)   { convert_class_to_method(wrapped_api_class) }
  let(:config)       { { test: true, format: API::VALID_FORMATS.sample } }
  let(:params)       { {} }

  it "should call execute on the appropriate api class" do
    expect(wrapped_api_class).to receive(:new).with(params, config) { api_instance }
    expect(api_instance).to      receive(:execute)

    AusPost.new(config).send(api_method, params)
  end
end

def convert_class_to_method(klass)
  klass.to_s.split(/(?=[A-Z])|::/).map(&:downcase).join('_').to_sym
end

describe AusPost do
  describe "#domestic_postcode_search" do
    it_behaves_like 'an api call', Domestic::Postcode::Search
  end

  describe "#country" do
    it_behaves_like 'an api call', Country
  end

  describe "#domestic_letter_thickness" do
    it_behaves_like 'an api call', Domestic::Letter::Thickness
  end

  describe "#postage_parcel_domestic_service" do
    it_behaves_like 'an api call', Postage::Parcel::Domestic::Service
  end

  describe "#postage_parcel_international_service" do
    it_behaves_like 'an api call', Postage::Parcel::International::Service
  end

  describe "#postage_parcel_domestic_calculate" do
    it_behaves_like 'an api call', Postage::Parcel::Domestic::Calculate
  end

  describe "#postage_parcel_international_calculate" do
    it_behaves_like 'an api call', Postage::Parcel::International::Calculate
  end
end
