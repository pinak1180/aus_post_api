class AusPost
  def initialize(config)
    @config = config
  end

  def postage_parcel_domestic(params)
    Postage::Parcel::Domestic.new(params, config).execute
  end

  def postage_parcel_international(params)
    Postage::Parcel::International.new(params, config).execute
  end
end
