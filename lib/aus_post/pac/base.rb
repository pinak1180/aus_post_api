class AusPost
  module PAC
    # The PACEndpoint module is responsible for constructing a uri and setting
    # headers that conform to the Postage Assesment Calculator API format.
    #
    # It requires the `api_uri` method and a @config hash to be defined
    module Base
      LIVE_URI = 'https://auspost.com.au/api'
      TEST_URI = 'https://test.npe.auspost.com.au'
      TEST_KEY = '28744ed5982391881611cca6cf5c240'
      FORMATS  = ['json', 'xml']

      def uri
        "#{base_uri}/#{api_uri}.#{format}?#{params}"
      end

      def headers
        { "AUTH-KEY" => @config[:TEST] ? TEST_KEY : auth_key }
      end

      private

      def api_uri
        raise ImplementationError.new('api_uri')
      end

      def base_uri
        @config[:TEST] ? TEST_URI : LIVE_URI
      end

      def format
        if @config[:FORMAT].nil?
          raise NoFormatProvidedError
        else
          if !FORMATS.include?(@config[:FORMAT])
            raise InvalidFormatError
          else
            @config[:FORMAT]
          end
        end
      end

      def params
        [].tap { |result|
          @attributes.keys.each { |a| result << "#{a}=#{self.send(a)}" }
        }.join('&')
      end

      def auth_key
        if @config[:PAC_AUTH_KEY].nil? && !@config[:TEST]
          raise NoAuthKeyProvidedError
        end

        @config[:PAC_AUTH_KEY]
      end

      class NoAuthKeyProvidedError < StandardError
        def initialize
          super("The called endpoint requires the PAC_AUTH_KEY to be set")
        end
      end

      class InvalidFormatError < StandardError
        def initialize
          super("Accepted formats are: #{AusPost::PAC::Base::FORMATS.join(', ')}")
        end
      end

      class NoFormatProvidedError < InvalidFormatError; end

      class ImplementationError < StandardError
        def initialize(method)
          super("No #{method} implemented")
        end
      end
    end
  end
end
