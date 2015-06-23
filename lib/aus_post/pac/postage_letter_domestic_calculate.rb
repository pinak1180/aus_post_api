class AusPost
  module PAC
    class PostageLetterDomesticCalculate < AusPost::API
      include AusPost::PAC::Base

      required_attributes :service_code, :weight
      optional_attributes :option_code, :suboption_code, :extra_cover

      def api_uri
        "postage/letter/domestic/calculate"
      end
    end
  end
end
