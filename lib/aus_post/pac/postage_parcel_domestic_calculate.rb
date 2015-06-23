class AusPost
  module PAC
    class PostageParcelDomesticCalculate < AusPost::API
      include AusPost::PAC::Base

      required_attributes :from_postcode, :to_postcode, :length, :width,
        :height, :weight, :service_code
      optional_attributes :option_code, :suboption_code, :extra_cover


      def api_uri
        "postage/parcel/domestic/calculate"
      end
    end
  end
end
