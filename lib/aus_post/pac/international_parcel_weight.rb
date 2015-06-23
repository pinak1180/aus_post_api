class AusPost
  module PAC
    class InternationalParcelWeight < AusPost::API
      include AusPost::PAC::Base

      def api_uri
        "postage/parcel/international/weight"
      end
    end
  end
end
