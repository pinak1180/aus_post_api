class AusPost
  module PAC
    class DomesticLetterSize
      REQUIRED_ATTRS = []
      OPTIONAL_ATTRS = []

      include AusPost::API

      def api_uri
        "postage/letter/domestic/size"
      end
    end
  end
end
