RSpec.shared_examples_for "an api call" do |wrapped_api_class|
  let(:api_instance) { instance_double(wrapped_api_class) }
  let(:api_method)   { wrapped_api_class.to_s.downcase.gsub(/::/, '_').to_sym }

  it "should call execute on the appropriate api class" do
    expect(wrapped_api_class).to receive(:new) { api_instance }
    expect(api_instance).to      receive(:execute)

    AusPost.new(config).send(api_method, {})
  end
end
