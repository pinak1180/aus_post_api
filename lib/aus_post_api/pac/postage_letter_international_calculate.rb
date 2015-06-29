module AusPostAPI
  class PAC
    class PostageLetterInternationalCalculate < AusPostAPI::PAC::Endpoint
      required_attributes :country_code, :service_code
      optional_attributes :weight, :option_code, :suboption_code, :extra_cover

      def api_uri
        "postage/letter/international/calculate"
      end
    end
  end
end
