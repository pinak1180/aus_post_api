class AusPost
  module PAC
    class DomesticLetterWeight < AusPost::API
      include AusPost::PAC::Base

      def api_uri
        "postage/letter/domestic/weight"
      end
    end
  end
end
