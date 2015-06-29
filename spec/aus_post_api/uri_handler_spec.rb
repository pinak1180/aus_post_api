require_relative '../../lib/aus_post_api/uri_handler'
require 'webmock/rspec'

describe AusPostAPI::UriHandler do
  it 'should make the call to the uri with the given headers' do
    stub_request(:get, "https://www.test.com:80/")
      .with(headers: { test: 'test' })
      .to_return(status: 200, body: "response", headers: {})

    expect(
      AusPostAPI::UriHandler.call('http://www.test.com', test: 'test').body
    ).to eql('response')
  end
end
