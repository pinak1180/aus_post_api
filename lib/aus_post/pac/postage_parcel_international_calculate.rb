class AusPost
  module PAC
    class PostageParcelInternationalCalculate
      REQUIRED_ATTRS = [:country_code, :weight, :service_code]
      OPTIONAL_ATTRS = [:option_code, :suboption_code, :extra_cover]

      include AusPost::API

      def api_uri
        "postage/parcel/international/calculate"
      end
    end
  end
end
