class AusPost
  module PAC
    class PostageLetterDomesticService < AusPost::API
      include AusPost::PAC::Base

      required_attributes :length, :width, :thickness, :weight

      def api_uri
        "postage/letter/domestic/service"
      end
    end
  end
end
