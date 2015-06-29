module AusPostAPI
  class DCE
    class ValidateAustralianAddress < AusPostAPI::DCE::Endpoint
      required_attributes :addressline1, :suburb, :postcode, :state, :country
      optional_attributes :addressline2

      def api_uri
        "ValidateAddress"
      end
    end
  end
end
