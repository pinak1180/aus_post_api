class AusPost
  module PAC
    class DomesticLetterSize < AusPost::API
      include AusPost::PAC::Base

      def api_uri
        "postage/letter/domestic/size"
      end
    end
  end
end
