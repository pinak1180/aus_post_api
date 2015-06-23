class AusPost
  module PAC
    class DomesticPostcodeSearch < AusPost::API
      include AusPost::PAC::Base

      required_attributes :q
      optional_attributes :state, :excludepostboxflag

      def api_uri
        "postcode/search"
      end
    end
  end
end
