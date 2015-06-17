require_relative '../../lib/aus_post/uri_handler'
require 'webmock/rspec'

describe AusPost::UriHandler do
  it 'should make the call to the uri with the given headers' do
    stub_request(:get, "https://www.test.com:80/")
      .with(headers: { test: 'test' })
      .to_return(status: 200, body: "response", headers: {})

    expect(
      AusPost::UriHandler.call('http://www.test.com', test: 'test').body
    ).to eql('response')
  end
end
