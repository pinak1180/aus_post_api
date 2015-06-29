require_relative '../../lib/aus_post_api/endpoint'

describe AusPostAPI::Endpoint do
  before do
    stub_const "NullUriHandler", Class.new { def self.call(uri, headers); nil; end }
    stub_const "AusPost::API::Attributes", Module.new
  end

  describe "#execute" do
    context "no `uri` or `headers` methods defined" do
      it "should raise an error" do
        test = AusPostAPI::Endpoint.new({}, {}, NullUriHandler)

        expect { test.execute }.to raise_error(
          AusPostAPI::Endpoint::ImplementationError
        )
      end
    end

    context "only the `uri` method defined" do
      it "should raise an error" do
        test = AusPostAPI::Endpoint.new({}, {}, NullUriHandler)

        def test.uri; "uri"; end

        expect { test.execute }.to raise_error(
          AusPostAPI::Endpoint::ImplementationError
        )
      end
    end

    context "both the `uri` and the `headers` method defined" do
      it "should not raise an error" do
        test = AusPostAPI::Endpoint.new({}, {}, NullUriHandler)

        def test.uri; "uri"; end
        def test.headers; "headers"; end

        expect { test.execute }.to_not raise_error
      end
    end
  end
end
