module AusPostAPI
  class PAC
    class PostageParcelDomesticService < AusPostAPI::PAC::Endpoint
      required_attributes :from_postcode, :to_postcode, :length, :width, :height,
        :weight

      def api_uri
        "postage/parcel/domestic/service"
      end
    end
  end
end
