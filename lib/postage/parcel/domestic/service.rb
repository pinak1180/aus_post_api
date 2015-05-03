module Postage
  module Parcel
    module Domestic
      class Service

        REQUIRED_ATTRS = [
          :from_postcode, :to_postcode, :length, :width, :height, :weight
        ]
        OPTIONAL_ATTRS = []

        include ::API

        def api_uri
          "postage/parcel/domestic/service.#{format}"
        end
      end
    end
  end
end
