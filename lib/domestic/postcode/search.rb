module Domestic
  module Postcode
    class Search
      REQUIRED_ATTRS = [:q]
      OPTIONAL_ATTRS = [:state, :excludepostboxflag]

      include ::API

      def api_uri
        "postcode/search"
      end
    end
  end
end
