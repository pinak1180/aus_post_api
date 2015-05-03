require 'spec_helper'

describe AusPost do
  describe "#postage_parcel_domestic_service" do
    let(:postage_parcel_domestic_service) do
      instance_double(Postage::Parcel::Domestic::Service)
    end

    it "should execute a postage parcel domestic service api call" do
      expect(Postage::Parcel::Domestic::Service).to receive(:new) do
        postage_parcel_domestic_service
      end

      expect(postage_parcel_domestic_service).to receive(:execute)

      AusPost.new(config).postage_parcel_domestic_service({})
    end
  end

  describe "#postage_parcel_international_service" do
    let(:postage_parcel_international_service) do
      instance_double(Postage::Parcel::International::Service)
    end

    it "should execute a postage parcel international service api call" do
      expect(Postage::Parcel::International::Service).to receive(:new) do
        postage_parcel_international_service
      end

      expect(postage_parcel_international_service).to receive(:execute)

      AusPost.new(config).postage_parcel_international_service({})
    end
  end
end
