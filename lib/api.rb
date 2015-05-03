require 'net/http'

module API
  def initialize(attributes, config)
    @config = config

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
    http.request(request)
  end

  def api_uri
    raise 'not implemented'
  end

  def format
    @config[:format]
  end

  private

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

    (self.class::REQUIRED_ATTRS + self.class::OPTIONAL_ATTRS).each do |attr|
      result << "#{attr}=#{self.send(attr)}"
    end

    result.join('&')
  end

  class RequiredArgumentError < StandardError
    def initialize(attr)
      super("#{attr} is a required argument")
    end
  end
end
