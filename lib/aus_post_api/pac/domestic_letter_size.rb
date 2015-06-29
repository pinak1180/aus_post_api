module AusPostAPI
  class PAC
    class DomesticLetterSize < AusPostAPI::PAC::Endpoint
      def api_uri
        "postage/letter/domestic/size"
      end
    end
  end
end
