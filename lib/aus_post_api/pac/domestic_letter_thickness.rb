module AusPostAPI
  class PAC
    class DomesticLetterThickness < AusPostAPI::PAC::Endpoint
      def api_uri
        "postage/letter/domestic/thickness"
      end
    end
  end
end
