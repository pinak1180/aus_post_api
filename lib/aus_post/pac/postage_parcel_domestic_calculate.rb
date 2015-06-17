class AusPost
  module PAC
    class PostageParcelDomesticCalculate
      REQUIRED_ATTRS = [
        :from_postcode, :to_postcode, :length, :width, :height, :weight,
        :service_code
      ]
      OPTIONAL_ATTRS = [:option_code, :suboption_code, :extra_cover]

      include AusPost::API

      def api_uri
        "postage/parcel/domestic/calculate"
      end
    end
  end
end
