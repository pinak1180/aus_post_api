module AusPostAPI
  class PAC
    class PostageLetterInternationalService < AusPostAPI::PAC::Endpoint
      required_attributes :country_code, :weight

      def api_uri
        "postage/letter/international/service"
      end
    end
  end
end
