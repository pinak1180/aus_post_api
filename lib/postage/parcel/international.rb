module Postage
  module Parcel
    class International
      include ::API

      ATTRS = [:country_code, :weight]
      attr_accessor *ATTRS

      def api_uri
        "postage/parcel/international/service.#{format}"
      end
    end
  end
end
