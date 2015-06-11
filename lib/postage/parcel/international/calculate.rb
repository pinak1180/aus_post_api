module Postage
  module Parcel
    module International
      class Calculate
        REQUIRED_ATTRS = [:country_code, :weight, :service_code]
        OPTIONAL_ATTRS = [:option_code, :suboption_code, :extra_cover]

        include ::API
      end
    end
  end
end
