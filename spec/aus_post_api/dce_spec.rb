require 'spec_helper'

RSpec.shared_examples_for "a DCE endpoint wrapper" do |wrapped_api_class|
  let(:api_instance) { instance_double(wrapped_api_class) }
  let(:api_method)   { convert_class_to_method(wrapped_api_class) }
  let(:params)       { { test: :param } }
  let(:config)       { { test: :config } }

  it "should call execute on the appropriate api class" do
    expect(wrapped_api_class).to receive(:new).with(params, config) { api_instance }
    expect(api_instance).to      receive(:execute)

    AusPostAPI::DCE.new(config).send(api_method, params)
  end
end

def convert_class_to_method(klass)
  klass = klass.to_s.gsub(/AusPostAPI::DCE/, '')

  # underscores -> camel case
  klass
    .to_s
    .gsub(/.*::/, '')
    .split(/(?=[A-Z])/)
    .map(&:downcase)
    .join('_')
end

describe AusPostAPI::DCE do
  describe "#validate_australian_address" do
    it_behaves_like 'a DCE endpoint wrapper', AusPostAPI::DCE::ValidateAustralianAddress
  end
end
