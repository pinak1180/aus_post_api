class AusPost
  module PAC
    class DomesticParcelSize < AusPost::API
      include AusPost::PAC::Base

      def api_uri
        "postage/parcel/domestic/size"
      end
    end
  end
end
