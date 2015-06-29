module AusPostAPI
  class PAC
    class PostageLetterDomesticService < AusPostAPI::PAC::Endpoint
      required_attributes :length, :width, :thickness, :weight

      def api_uri
        "postage/letter/domestic/service"
      end
    end
  end
end
