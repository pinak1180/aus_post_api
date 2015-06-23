class AusPost
  module PAC
    class DomesticParcelWeight < AusPost::API
      include AusPost::PAC::Base

      def api_uri
        "postage/parcel/domestic/weight"
      end
    end
  end
end
