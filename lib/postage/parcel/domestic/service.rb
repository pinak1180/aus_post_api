module Postage
  module Parcel
    module Domestic
      class Service
        include ::API

        REQUIRED_ATTRS = [
          :from_postcode, :to_postcode, :length, :width, :height, :weight
        ]
        OPTIONAL_ATTRS = []
        attr_accessor *(REQUIRED_ATTRS + OPTIONAL_ATTRS)

        def api_uri
          "postage/parcel/domestic/service.#{format}"
        end
      end
    end
  end
end
