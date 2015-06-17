class AusPost
  module PAC
    class PostageParcelInternationalService
      REQUIRED_ATTRS = [:country_code, :weight]
      OPTIONAL_ATTRS = []

      include AusPost::API

      def api_uri
        "postage/parcel/international/service"
      end
    end
  end
end
