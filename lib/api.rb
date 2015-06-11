module API
  BASE_URI = 'https://auspost.com.au/api'

  def self.included(base)
    attr_accessor *(base::REQUIRED_ATTRS + base::OPTIONAL_ATTRS)
  end

  def initialize(attributes, config)
    @config     = config
    @attributes = attributes

    set_attributes
  end

  def execute
    UriHandler.call(uri, headers)
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
    "#{@config[:base_uri] || BASE_URI}/#{api_uri}.#{@config[:format]}?#{params}"
  end

  def headers
    { "AUTH-KEY" => @config[:auth_key] }
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
end
