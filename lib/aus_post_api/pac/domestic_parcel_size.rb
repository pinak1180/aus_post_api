module AusPostAPI
  class PAC
    class DomesticParcelSize < AusPostAPI::PAC::Endpoint
      def api_uri
        "postage/parcel/domestic/size"
      end
    end
  end
end
