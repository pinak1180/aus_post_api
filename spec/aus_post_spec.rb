require 'spec_helper'

RSpec.shared_examples_for "an api call" do |wrapped_api_class|
  let(:api_instance) { instance_double(wrapped_api_class) }
  let(:api_method)   { wrapped_api_class.to_s.downcase.gsub(/::/, '_').to_sym }
  let(:config)       { { test: true, format: AusPost::VALID_FORMATS.sample } }
  let(:params)       { {} }

  it "should call execute on the appropriate api class" do
    expect(wrapped_api_class).to receive(:new).with(params, config) { api_instance }
    expect(api_instance).to      receive(:execute)

    AusPost.new(config).send(api_method, params)
  end
end

describe AusPost do
  describe "Validating config options" do
    let(:valid_test_config) {
      { test: true, format: AusPost::VALID_FORMATS.sample, auth_key: '123' }
    }

    describe "Setting an Auth Key" do
      context "the test configuration is set to true" do
        it "should not raise an error if no auth key is provided" do
          valid_test_config.delete(:auth_key)

          expect {
            AusPost.new(valid_test_config.merge(test: true))
          }.to_not raise_error
        end
      end

      context "the test configuration is set to false" do
        it "should raise an error if no auth key is provided" do
          valid_test_config.delete(:auth_key)

          expect {
            AusPost.new(valid_test_config.merge(test: false))
          }.to raise_error(
            AusPost::NoAuthKeyProvidedError
          )
        end
      end
    end

    describe "Setting a format" do
      context "no format is provided" do
        it "should raise an error" do
          valid_test_config.delete(:format)

          expect { AusPost.new(valid_test_config) }.to raise_error(
            AusPost::NoFormatProvidedError
          )
        end
      end

      context "an invalid format is provided" do
        it "should raise an error" do
          expect {
            AusPost.new(valid_test_config.merge(format: 'not valid'))
          }.to raise_error(
            AusPost::InvalidFormatError
          )
        end
      end
    end
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
