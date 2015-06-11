module Postage
  module Parcel
    module International
      class Service
        REQUIRED_ATTRS = [:country_code, :weight]
        OPTIONAL_ATTRS = []

        include ::API
      end
    end
  end
end
