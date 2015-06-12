# The API module sets the parameters for an api call and constructs the uri.
#
# It relies on the following conventions
#
# 1. Any class that includes the module must specify two constants
#    REQUIRED_ATTRS & OPTIONAL_ATTRS
#
# 2. The class name must be nested within modules that represent the uri call
#    eg. if the required uri is '<base>/parcel/calculate' the class name must be
#    `Parcel::Calculate` OR the class must override the `api_uri` method.
#
#    This maps to the naming convention used by the Australia Post API.
module API
  LIVE_URI      = 'https://auspost.com.au/api'
  TEST_URI      = 'https://test.npe.auspost.com.au'
  TEST_AUTH_KEY = '28744ed5982391881611cca6cf5c240'
  VALID_FORMATS = ['json', 'xml']

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
    UriHandler.call(uri, headers)
  end

  private

  def validate_config
    if @config[:auth_key].nil? && !@config[:test]
      raise NoAuthKeyProvidedError
    end

    if @config[:format].nil?
      raise NoFormatProvidedError
    else
      if !VALID_FORMATS.include?@config[:format]
        raise InvalidFormatError
      end
    end
  end

  def set_attributes
    required_param = -> (attr) { raise ::API::RequiredArgumentError.new(attr) }

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
    @config[:test] ? TEST_URI : LIVE_URI
  end

  def headers
    { "AUTH-KEY" => @config[:test] ? TEST_AUTH_KEY : @config[:auth_key] }
  end

  def api_uri
    self.class.to_s.split('::').map(&:downcase).join('/')
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
