module Postage
  module Parcel
    module International
      class Service
        REQUIRED_ATTRS = [:country_code, :weight]
        OPTIONAL_ATTRS = []

        include ::API

        def api_uri
          "postage/parcel/international/service.#{format}"
        end
      end
    end
  end
end
