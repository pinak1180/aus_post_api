require 'spec_helper'

describe AusPost do
  describe "#postage_parcel_domestic" do
    let(:postage_parcel_domestic) do
      instance_double(Postage::Parcel::Domestic)
    end

    it "should execute a postage parcel domestic api call" do
      expect(Postage::Parcel::Domestic).to receive(:new) do
        postage_parcel_domestic
      end

      expect(postage_parcel_domestic).to receive(:execute)

      AusPost.new(config).postage_parcel_domestic({})
    end
  end

  describe "#postage_parcel_international" do
    let(:postage_parcel_international) do
      instance_double(Postage::Parcel::International)
    end

    it "should execute a postage parcel international api call" do
      expect(Postage::Parcel::International).to receive(:new) do
        postage_parcel_international
      end

      expect(postage_parcel_international).to receive(:execute)

      AusPost.new(config).postage_parcel_international({})
    end
  end
end
