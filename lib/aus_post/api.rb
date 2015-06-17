# The API module sets the parameters for an api call and constructs the uri.
#
# Any class that includes the module must specify two constants:
# REQUIRED_ATTRS & OPTIONAL_ATTRS

class AusPost
  module API
    LIVE_URI      = 'https://auspost.com.au/api'
    VALID_FORMATS = ['json', 'xml']
    TEST_URI      = 'https://test.npe.auspost.com.au'
    TEST_AUTH_KEY = '28744ed5982391881611cca6cf5c240'

    def self.included(base)
      if !defined?(base::REQUIRED_ATTRS) || !defined?(base::OPTIONAL_ATTRS)
        raise ImplementationError
      end

      attr_accessor *(base::REQUIRED_ATTRS + base::OPTIONAL_ATTRS)
    end

    def initialize(attributes, config)
      @config     = config
      @attributes = attributes

      validate_config

      set_attributes
    end

    def execute
      AusPost::UriHandler.call(uri, headers)
    end

    private

    def validate_config
      if @config[:auth_key].nil? && !@config[:test]
        raise NoAuthKeyProvidedError
      end

      if @config[:format].nil?
        raise NoFormatProvidedError
      else
        if !self.class::VALID_FORMATS.include?@config[:format]
          raise InvalidFormatError
        end
      end
    end

    def set_attributes
      required_param = -> (attr) { raise RequiredArgumentError.new(attr) }

      self.class::REQUIRED_ATTRS.each do |attr|
        self.send("#{attr}=", @attributes.fetch(attr, &required_param))
      end

      self.class::OPTIONAL_ATTRS.each do |attr|
        self.send("#{attr}=", @attributes.fetch(attr)) if @attributes.has_key?(attr)
      end
    end

    def uri
      "#{base_uri}/#{api_uri}.#{@config[:format]}?#{params}"
    end

    def base_uri
      @config[:test] ? self.class::TEST_URI : self.class::LIVE_URI
    end

    def headers
      { "AUTH-KEY" => @config[:test] ? self.class::TEST_AUTH_KEY : @config[:auth_key] }
    end

    def api_uri
      raise ImplementationError
    end

    def params
      [].tap { |result|
        @attributes.keys.each { |attr| result << "#{attr}=#{self.send(attr)}" }
      }.join('&')
    end

    class RequiredArgumentError < StandardError
      def initialize(attr)
        super("#{attr} is a required argument")
      end
    end

    class ImplementationError < StandardError
      def initialize
        super(
          "There was a problem including the API module. Check the class" \
          "comments for required conventions"
        )
      end
    end

    class NoAuthKeyProvidedError < StandardError; end

    class InvalidFormatError < StandardError
      def initialize
        super("Accepted formats are: #{API::VALID_FORMATS.join(', ')}")
      end
    end

    class NoFormatProvidedError < InvalidFormatError; end
  end
end
