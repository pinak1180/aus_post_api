class AusPost
  module PAC
    class PostageLetterInternationalCalculate < AusPost::API
      include AusPost::PAC::Base

      required_attributes :country_code, :service_code
      optional_attributes :weight, :option_code, :suboption_code, :extra_cover

      def api_uri
        "postage/letter/international/calculate"
      end
    end
  end
end
