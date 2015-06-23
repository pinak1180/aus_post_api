class AusPost
  module PAC
    class PostageParcelInternationalService < AusPost::API
      include AusPost::PAC::Base

      required_attributes :country_code, :weight

      def api_uri
        "postage/parcel/international/service"
      end
    end
  end
end
