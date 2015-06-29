module AusPostAPI
  # The PAC class implements methods specified by the Australia Post Delivery
  # Choices API. A config hash must be supplied that specifies a valid
  # DCE_AUTH_KEY, and request format. Setting the key TEST to true in the config
  # hash will ignore any supplied auth_key and use the test endpoint.
  class DCE
    def initialize(config)
      @config = config
    end

    def validate_australian_address(params = {})
      AusPostAPI::DCE::ValidateAustralianAddress.new(params, @config).execute
    end
  end
end
