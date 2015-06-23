class AusPost
  module PAC
    class Country < AusPost::API
      include AusPost::PAC::Base

      def api_uri
        "postage/country"
      end
    end
  end
end
