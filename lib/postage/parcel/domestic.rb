module Postage
  module Parcel
    class Domestic
      include ::API

      ATTRS = [
        :from_postcode, :to_postcode, :length, :width, :height, :weight
      ]
      attr_accessor *ATTRS

      def api_uri
        "postage/parcel/domestic/service.#{format}"
      end
    end
  end
end
