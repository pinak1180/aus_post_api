class AusPost
  module PAC
    class DomesticLetterThickness
      REQUIRED_ATTRS = []
      OPTIONAL_ATTRS = []

      include AusPost::API

      def api_uri
        "postage/letter/domestic/thickness"
      end
    end
  end
end
