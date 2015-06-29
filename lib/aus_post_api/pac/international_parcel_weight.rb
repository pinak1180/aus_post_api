module AusPostAPI
  class PAC
    class InternationalParcelWeight < AusPostAPI::PAC::Endpoint
      def api_uri
        "postage/parcel/international/weight"
      end
    end
  end
end
