class AusPost
  module PAC
    class Country
      REQUIRED_ATTRS = []
      OPTIONAL_ATTRS = []

      include AusPost::API

      def api_uri
        "postage/country"
      end
    end
  end
end
