module API
  def self.included(base)
    attr_accessor *(base::REQUIRED_ATTRS + base::OPTIONAL_ATTRS)
  end

  def initialize(attributes, config)
    @config     = config
    @attributes = attributes

    set_attributes
  end

  def execute
    UriHandler.call(uri, headers).tap { |response| handle_errors(response) }
  end

  private

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
    "#{base_uri}/#{api_uri}.#{format}?#{params}"
  end

  def headers
    { "AUTH-KEY" => @config[:auth_key] }
  end

  def handle_errors(response)
    if error_returned?(response)
      raise RequestInvalidError.new(error_message(response))
    end
  end

  def base_uri
    # TODO: set this as a default somewhere
    @config[:base_uri]
  end

  def api_uri
    self.class.to_s.split('::').map(&:downcase).join('/')
  end

  def params
    [].tap { |result|
      @attributes.keys.each { |attr| result << "#{attr}=#{self.send(attr)}" }
    }.join('&')
  end

  def format
    @config[:format]
  end

  def error_returned?(response)
    if format == 'json'
      !!JSON.parse(response.body)["error"]
    elsif format == 'xml'
      # not implemented
    end
  end

  def error_message(response)
    return unless error_returned?(response)

    if format == 'json'
      JSON.parse(response.body)["error"]["errorMessage"]
    elsif format == 'xml'
      # not implemented
    end
  end

  class RequiredArgumentError < StandardError
    def initialize(attr)
      super("#{attr} is a required argument")
    end
  end

  class RequestInvalidError < StandardError
    def initialize(message)
      super(message)
    end
  end
end
