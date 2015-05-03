module Postage
  module Parcel
    module Domestic
      class Calculate
        include ::API

        REQUIRED_ATTRS = [
          :from_postcode, :to_postcode, :length, :width, :height, :weight,
          :service_code
        ]
        OPTIONAL_ATTRS = [:option_code, :suboption_code, :extra_cover]
        attr_accessor *(REQUIRED_ATTRS + OPTIONAL_ATTRS)

        def api_uri
          "postage/parcel/domestic/calculate.#{format}"
        end
      end
    end
  end
end
