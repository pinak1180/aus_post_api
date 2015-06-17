class AusPost
  module PAC
    class DomesticLetterWeight
      REQUIRED_ATTRS = []
      OPTIONAL_ATTRS = []

      include AusPost::API

      def api_uri
        "postage/letter/domestic/weight"
      end
    end
  end
end
