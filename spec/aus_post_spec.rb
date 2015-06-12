require 'spec_helper'

RSpec.shared_examples_for "an api call" do |wrapped_api_class|
  let(:api_instance) { instance_double(wrapped_api_class) }
  let(:api_method)   { wrapped_api_class.to_s.downcase.gsub(/::/, '_').to_sym }
  let(:config)       { { test: true, format: API::VALID_FORMATS.sample } }
  let(:params)       { {} }

  it "should call execute on the appropriate api class" do
    expect(wrapped_api_class).to receive(:new).with(params, config) { api_instance }
    expect(api_instance).to      receive(:execute)

    AusPost.new(config).send(api_method, params)
  end
end

describe AusPost do
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
