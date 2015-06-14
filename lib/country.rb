class Country
  REQUIRED_ATTRS = []
  OPTIONAL_ATTRS = []

  include ::API

  def api_uri
    "postage/country"
  end
end
