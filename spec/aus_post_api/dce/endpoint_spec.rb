require 'spec_helper'

describe AusPostAPI::DCE::Endpoint do
  describe "Implementation" do
    context "no `api_uri` method is defined" do
      it "should raise an error" do
        dce_endpoint = Class.new(AusPostAPI::DCE::Endpoint).new({}, dce_config)

        expect { dce_endpoint.uri }.to(
          raise_error(AusPostAPI::DCE::Endpoint::ImplementationError)
        )
      end
    end

    context "an `api_uri` method is defined" do
      it "should not raise an error" do
        dce_endpoint = Class.new(AusPostAPI::DCE::Endpoint) do
          def api_uri
            'api_uri'
          end
        end.new({}, dce_config)

        expect { dce_endpoint.uri }.to_not raise_error
      end
    end
  end

  describe "Configuration" do
    before do
      stub_const('DCEEndpoint', Class.new(AusPostAPI::DCE::Endpoint) {
        def api_uri; 'api_uri'; end
      })
    end

    describe "Format" do
      context "no format is provided" do
        it "should raise an error" do
          no_format_config = dce_config
          no_format_config.delete(:FORMAT)

          dce_endpoint = DCEEndpoint.new({}, no_format_config)

          expect { dce_endpoint.uri }.to(
            raise_error(AusPostAPI::DCE::Endpoint::NoFormatProvidedError)
          )
        end
      end

      context "an invalid format is provided" do
        it "should raise an error" do
          dce_endpoint = DCEEndpoint.new({}, dce_config.merge(FORMAT: :invalid))

          expect { dce_endpoint.uri }.to(
            raise_error(AusPostAPI::DCE::Endpoint::InvalidFormatError)
          )
        end
      end
    end

    context "no USERNAME is provided" do
      it "should raise an error" do
        no_username_config = dce_config
        no_username_config.delete(:USERNAME)

        dce_endpoint = DCEEndpoint.new({}, no_username_config)

        expect { dce_endpoint.headers }.to(
          raise_error(AusPostAPI::DCE::Endpoint::NoHeaderProvidedError)
        )
      end
    end

    context "no PASSWORD is provided" do
      it "should raise an error" do
        no_password_config = dce_config
        no_password_config.delete(:PASSWORD)

        dce_endpoint = DCEEndpoint.new({}, no_password_config)

        expect { dce_endpoint.headers }.to(
          raise_error(AusPostAPI::DCE::Endpoint::NoHeaderProvidedError)
        )
      end
    end
  end
end
