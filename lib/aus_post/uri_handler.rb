require 'net/http'

# The UriHandler class is wrapper around a http technology. It takes a uri and
# a hash of header key values pairs and makes a http request.
class AusPost
  class UriHandler
    def self.call(uri, headers={})
      self.new(uri, headers).call
    end

    def initialize(uri, headers)
      @headers = headers
      @uri     = URI.parse(uri)
    end

    def call
      http.request(request)
    end

    private

    def http
      @http ||= Net::HTTP.new(@uri.host, @uri.port).tap do |h|
        h.use_ssl     = true
        h.verify_mode = OpenSSL::SSL::VERIFY_PEER
      end
    end

    def request
      @request ||= Net::HTTP::Get.new(@uri).tap do |r|
        @headers.each { |key, val| r.add_field(key, val) }
      end
    end
  end
end
