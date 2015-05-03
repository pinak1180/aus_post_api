require 'spec_helper'

describe AusPost do
  describe "#postage_parcel_domestic_service" do
    it_behaves_like 'an api call', Postage::Parcel::Domestic::Service
  end

  describe "#postage_parcel_international_service" do
    it_behaves_like 'an api call', Postage::Parcel::International::Service
  end

  describe "#postage_parcel_domestic_calculate" do
    it_behaves_like 'an api call', Postage::Parcel::Domestic::Calculate
  end

  describe "#postage_parcel_international_calculate" do
    it_behaves_like 'an api call', Postage::Parcel::International::Calculate
  end
end
