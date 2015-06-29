module AusPostAPI
  class PAC
    class DomesticLetterWeight < AusPostAPI::PAC::Endpoint
      def api_uri
        "postage/letter/domestic/weight"
      end
    end
  end
end
