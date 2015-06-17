class AusPost
  module PAC
    class DomesticPostcodeSearch
      REQUIRED_ATTRS = [:q]
      OPTIONAL_ATTRS = [:state, :excludepostboxflag]

      include AusPost::API

      def api_uri
        "postcode/search"
      end
    end
  end
end
