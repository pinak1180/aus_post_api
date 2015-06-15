module Domestic
  module Letter
    class Weight
      REQUIRED_ATTRS = []
      OPTIONAL_ATTRS = []

      include ::API

      def api_uri
        "postage/letter/domestic/weight"
      end
    end
  end
end
