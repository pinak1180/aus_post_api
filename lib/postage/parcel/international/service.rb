module Postage
  module Parcel
    module International
      class Service
        include ::API

        REQUIRED_ATTRS = [:country_code, :weight]
        OPTIONAL_ATTRS = []
        attr_accessor *(REQUIRED_ATTRS + OPTIONAL_ATTRS)

        def api_uri
          "postage/parcel/international/service.#{format}"
        end
      end
    end
  end
end
