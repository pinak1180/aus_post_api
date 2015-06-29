module AusPostAPI
  class PAC
    class DomesticPostcodeSearch < AusPostAPI::PAC::Endpoint
      required_attributes :q
      optional_attributes :state, :excludepostboxflag

      def api_uri
        "postcode/search"
      end
    end
  end
end
