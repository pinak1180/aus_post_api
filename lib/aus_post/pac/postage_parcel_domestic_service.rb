class AusPost
  module PAC
    class PostageParcelDomesticService < AusPost::API
      include AusPost::PAC::Base

      required_attributes :from_postcode, :to_postcode, :length, :width, :height,
        :weight

      def api_uri
        "postage/parcel/domestic/service"
      end
    end
  end
end
