class AusPost
  module PAC
    class DomesticLetterThickness < AusPost::API
      include AusPost::PAC::Base

      def api_uri
        "postage/letter/domestic/thickness"
      end
    end
  end
end
