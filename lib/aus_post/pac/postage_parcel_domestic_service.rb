class AusPost
  module PAC
    class PostageParcelDomesticService
      REQUIRED_ATTRS = [
        :from_postcode, :to_postcode, :length, :width, :height, :weight
      ]
      OPTIONAL_ATTRS = []

      include AusPost::API

      def api_uri
        "postage/parcel/domestic/service"
      end
    end
  end
end
