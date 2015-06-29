module AusPostAPI
  class PAC
    class DomesticParcelWeight < AusPostAPI::PAC::Endpoint
      def api_uri
        "postage/parcel/domestic/weight"
      end
    end
  end
end
