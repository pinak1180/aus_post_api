module Domestic
  module Letter
    class Thickness
      REQUIRED_ATTRS = []
      OPTIONAL_ATTRS = []

      include ::API

      def api_uri
        "postage/letter/domestic/thickness"
      end
    end
  end
end
