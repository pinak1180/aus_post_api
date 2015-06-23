class AusPost
  module PAC
    class DomesticParcelType < AusPost::API
      include AusPost::PAC::Base

      def api_uri
        "postage/parcel/domestic/type"
      end
    end
  end
end
