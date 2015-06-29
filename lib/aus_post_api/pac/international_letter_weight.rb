module AusPostAPI
  class PAC
    class InternationalLetterWeight < AusPostAPI::PAC::Endpoint
      def api_uri
        "postage/letter/international/weight"
      end
    end
  end
end
