module Postage
  module Parcel
    module Domestic
      class Calculate
        REQUIRED_ATTRS = [
          :from_postcode, :to_postcode, :length, :width, :height, :weight,
          :service_code
        ]
        OPTIONAL_ATTRS = [:option_code, :suboption_code, :extra_cover]

        include ::API
      end
    end
  end
end
