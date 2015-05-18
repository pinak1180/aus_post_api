require 'net/http'

module API
  def self.included(base)
    base.const_set('ATTRS', base::REQUIRED_ATTRS + base::OPTIONAL_ATTRS)

    attr_accessor(*(base::ATTRS))
  end

  def initialize(attributes, config)
    @config     = config
    @attributes = attributes

    required_param = -> (attr) { raise ::API::RequiredArgumentError.new(attr) }

    self.class::REQUIRED_ATTRS.each do |attr|
      self.send("#{attr}=", attributes.fetch(attr, &required_param))
    end

    self.class::OPTIONAL_ATTRS.each do |attr|
      if attributes.has_key?(attr)
        self.send("#{attr}=", attributes.fetch(attr))
      end
    end
  end

  def execute
    response = http.request(request)

    handle_errors(response)

    response
  end

  def api_uri
    raise 'not implemented'
  end

  def format
    @config[:format]
  end

  private

  def handle_errors(response)
    if error_returned?(response)
      message = error_message(response)

      case message
      when /\A.*Service code.*\z/
        raise InvalidServiceCodeError.new(message)
      when /\A.*cannot exceed.*\z/
        raise InvalidDimensionError.new(message)
      when /\A.*maximum weight.*\z/
        raise InvalidWeightError.new(message)
      end
    end
  end

  def error_returned?(response)
    if format == 'json'
      json = JSON.parse(response.body)
      json["error"]
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

  def http
    @http ||= Net::HTTP.new(uri.host, uri.port).tap do |h|
      h.use_ssl = true
      h.verify_mode = OpenSSL::SSL::VERIFY_PEER
    end
  end

  def request
    @request ||= Net::HTTP::Get.new(uri).tap do |r|
      r.add_field("AUTH-KEY", @config[:auth_key])
    end
  end

  def uri
    @uri ||= URI.parse("#{@config[:base_uri]}/#{api_uri}?#{params}")
  end

  def params
    result = []

    @attributes.keys.each do |attr|
      result << "#{attr}=#{self.send(attr)}"
    end

    result.join('&')
  end

  class RequiredArgumentError < StandardError
    def initialize(attr)
      super("#{attr} is a required argument")
    end
  end

  class InvalidServiceCodeError < StandardError
    def initialize(message)
      super(message)
    end
  end

  class InvalidDimensionError < StandardError
    def initialize(message)
      super(message)
    end
  end

  class InvalidWeightError < StandardError
    def initialize(message)
      super(message)
    end
  end
end
