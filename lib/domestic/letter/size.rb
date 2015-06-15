module Domestic
  module Letter
    class Size
      REQUIRED_ATTRS = []
      OPTIONAL_ATTRS = []

      include ::API

      def api_uri
        "postage/letter/domestic/size"
      end
    end
  end
end
