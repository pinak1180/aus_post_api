module Postage
  module Parcel
    module Domestic
      class Service
        REQUIRED_ATTRS = [
          :from_postcode, :to_postcode, :length, :width, :height, :weight
        ]
        OPTIONAL_ATTRS = []

        include ::API
      end
    end
  end
end
