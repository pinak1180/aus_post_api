require 'spec_helper'

class PACEndpoint < AusPost::API
  include AusPost::PAC::Base

  def api_uri
    "test/endpoint"
  end
end

class UnimplementedPACEndpoint < AusPost::API
  include AusPost::PAC::Base
end

describe "Implementing a PAC endpoint" do
  context "no `api_uri` method is defined" do
    it "should raise an error" do
      pac_endpoint = UnimplementedPACEndpoint.new({}, json_config)

      expect { pac_endpoint.uri }.to(
        raise_error(AusPost::PAC::Base::ImplementationError)
      )
    end
  end

  context "an `api_uri` method is defined" do
    it "should not raise an error" do
      pac_endpoint = UnimplementedPACEndpoint.new({}, json_config)

      def pac_endpoint.api_uri; "api_uri"; end

      expect { pac_endpoint.uri }.to_not raise_error
    end
  end
end

describe "Configuring a PAC endpoint" do
  context "no format is provided" do
    it "should raise an error" do
      no_format_config = json_config
      no_format_config.delete(:FORMAT)

      pac_endpoint = PACEndpoint.new({}, no_format_config)

      expect { pac_endpoint.uri }.to(
        raise_error(AusPost::PAC::Base::NoFormatProvidedError)
      )
    end
  end

  context "an invalid format is provided" do
    it "should raise an error" do
      pac_endpoint = PACEndpoint.new({}, json_config.merge(FORMAT: :invalid))

      expect { pac_endpoint.uri }.to(
        raise_error(AusPost::PAC::Base::InvalidFormatError)
      )
    end
  end

  context "no PAC_AUTH_KEY is provided" do
    context "the TEST config is false" do
      it "should raise an error" do
        no_auth_key_config = json_config.merge(TEST: false)
        no_auth_key_config.delete(:PAC_AUTH_KEY)

        pac_endpoint = PACEndpoint.new({}, no_auth_key_config)

        expect { pac_endpoint.headers }.to(
          raise_error(AusPost::PAC::Base::NoAuthKeyProvidedError)
        )
      end
    end

    context "the TEST config is true" do
      it "should not raise an error" do
        no_auth_key_config = json_config.merge(TEST: true)
        no_auth_key_config.delete(:PAC_AUTH_KEY)

        pac_endpoint = PACEndpoint.new({}, no_auth_key_config)

        expect { pac_endpoint.headers }.to_not raise_error
      end
    end
  end

  context "a PAC_AUTH_KEY is provided" do
    context "the TEST config is false" do
      it "should not raise an error" do
        no_auth_key_config =

        pac_endpoint = PACEndpoint.new({}, json_config.merge(
          TEST: false, PAC_AUTH_KEY: :abc
        ))

        expect { pac_endpoint.headers }.to_not raise_error
      end
    end

    context "the TEST config is true" do
      it "should not raise an error" do

        pac_endpoint = PACEndpoint.new({}, json_config.merge(
          TEST: true, PAC_AUTH_KEY: :abc
        ))

        expect { pac_endpoint.headers }.to_not raise_error
      end
    end
  end
end
