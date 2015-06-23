class AusPost
  module PAC
    class PostageParcelInternationalCalculate < AusPost::API
      include AusPost::PAC::Base

      required_attributes :country_code, :weight, :service_code
      optional_attributes :option_code, :suboption_code, :extra_cover

      def api_uri
        "postage/parcel/international/calculate"
      end
    end
  end
end
