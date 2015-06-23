class AusPost
  module PAC
    class InternationalLetterWeight < AusPost::API
      include AusPost::PAC::Base

      def api_uri
        "postage/letter/international/weight"
      end
    end
  end
end
