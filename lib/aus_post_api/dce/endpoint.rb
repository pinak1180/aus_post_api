require 'base64'

module AusPostAPI
  class DCE
    # Abstract class that defines a DCE::Endpoint. It implements the `uri` &
    # `headers` methods and expects the `api_uri` method to be implemented.
    class Endpoint < AusPostAPI::Endpoint
      LIVE_URI = 'https://api.auspost.com.au/'
      FORMATS  = ['json', 'xml']

      def uri
        "#{LIVE_URI}/#{api_uri}.#{format}?#{params}"
      end

      def headers
        { "Authorization" => "Basic #{basic_auth}" }
      end

      private

      def api_uri
        raise ImplementationError.new('api_uri')
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
          @attributes.keys.each { |a| result << "#{a}=#{self.send(a).split.join('+')}" }
        }.join('&')
      end

      def basic_auth
        Base64.encode64("#{username}:#{password}")
      end

      def username
        raise NoHeaderProvidedError.new('USERNAME') if @config[:USERNAME].nil?

        @config[:USERNAME]
      end

      def password
        raise NoHeaderProvidedError.new('PASSWORD') if @config[:PASSWORD].nil?

        @config[:PASSWORD]
      end

      class NoHeaderProvidedError < StandardError
        def initialize(header)
          super("The called endpoint requires the #{header} config to be set")
        end
      end

      class InvalidFormatError < StandardError
        def initialize
          super("Accepted formats are: #{AusPostAPI::DCE::Endpoint::FORMATS.join(', ')}")
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
