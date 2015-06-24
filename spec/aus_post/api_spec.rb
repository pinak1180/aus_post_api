require_relative '../../lib/aus_post/api'

describe AusPost::API do
  before do
    stub_const "NullUriHandler", Class
    stub_const "AusPost::API::Attributes", Module.new
  end

  describe "#execute" do
    context "no `uri` or `headers` methods defined" do
      it "should raise an error" do
        test = AusPost::API.new({}, {}, NullUriHandler)

        expect { test.execute }.to raise_error(AusPost::API::ImplementationError)
      end
    end

    context "only the `uri` method defined" do
      it "should raise an error" do
        test = AusPost::API.new({}, {}, NullUriHandler)

        def test.uri; "uri"; end

        expect { test.execute }.to raise_error(AusPost::API::ImplementationError)
      end
    end

    context "both the `uri` and the `headers` method defined" do
      it "should not raise an error" do
        expect(NullUriHandler).to receive(:call)

        test = AusPost::API.new({}, {}, NullUriHandler)

        def test.uri; "uri"; end
        def test.headers; "headers"; end

        expect { test.execute }.to_not raise_error
      end
    end
  end
end
