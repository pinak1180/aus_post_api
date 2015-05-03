class AusPost
  def initialize(config)
    @config = config
  end

  def postage_parcel_domestic_service(params)
    Postage::Parcel::Domestic::Service.new(params, config).execute
  end

  def postage_parcel_international_service(params)
    Postage::Parcel::International::Service.new(params, config).execute
  end
end
