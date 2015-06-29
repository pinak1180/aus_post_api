module AusPostAPI
  class PAC
    class Country < AusPostAPI::PAC::Endpoint
      def api_uri
        "postage/country"
      end
    end
  end
end
