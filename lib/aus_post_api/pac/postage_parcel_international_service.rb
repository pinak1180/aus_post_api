module AusPostAPI
  class PAC
    class PostageParcelInternationalService < AusPostAPI::PAC::Endpoint
      required_attributes :country_code, :weight

      def api_uri
        "postage/parcel/international/service"
      end
    end
  end
end
