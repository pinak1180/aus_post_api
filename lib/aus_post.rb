Dir[(File.dirname(__dir__)) + "/lib/**/*.rb"].each { |f| require f }

# The AusPost class is the main entry point to the gem. It takes a config hash
# that must specify an valid auth key, and request format. Setting the test key
# to true in the config hash will ignore any supplied auth_key and use the test
# endpoint.
#
# The method interface serves as documentation for the implemented endpoints.
class AusPost
  def initialize(config)
    @config = config
  end

  def domestic_postcode_search(params)
    Domestic::Postcode::Search.new(params, @config).execute
  end

  def country(params)
    Country.new(params, @config).execute
  end

  def domestic_letter_thickness(params)
    Domestic::Letter::Thickness.new(params, @config).execute
  end

  def postage_parcel_domestic_service(params)
    Postage::Parcel::Domestic::Service.new(params, @config).execute
  end

  def postage_parcel_domestic_calculate(params)
    Postage::Parcel::Domestic::Calculate.new(params, @config).execute
  end

  def postage_parcel_international_service(params)
    Postage::Parcel::International::Service.new(params, @config).execute
  end

  def postage_parcel_international_calculate(params)
    Postage::Parcel::International::Calculate.new(params, @config).execute
  end
end
