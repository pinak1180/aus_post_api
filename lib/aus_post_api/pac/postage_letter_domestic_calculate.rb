module AusPostAPI
  class PAC
    class PostageLetterDomesticCalculate < AusPostAPI::PAC::Endpoint
      required_attributes :service_code, :weight
      optional_attributes :option_code, :suboption_code, :extra_cover

      def api_uri
        "postage/letter/domestic/calculate"
      end
    end
  end
end
