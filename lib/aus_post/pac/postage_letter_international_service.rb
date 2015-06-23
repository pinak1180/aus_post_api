class AusPost
  module PAC
    class PostageLetterInternationalService < AusPost::API
      include AusPost::PAC::Base

      required_attributes :country_code, :weight

      def api_uri
        "postage/letter/international/service"
      end
    end
  end
end
