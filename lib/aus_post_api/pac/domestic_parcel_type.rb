module AusPostAPI
  class PAC
    class DomesticParcelType < AusPostAPI::PAC::Endpoint
      def api_uri
        "postage/parcel/domestic/type"
      end
    end
  end
end
