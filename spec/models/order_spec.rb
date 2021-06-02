require "rails_helper"

RSpec.describe Order, type: :model do
  describe "association" do
    it { should belong_to(:user) }
    it { should have_many(:order_details).dependent(:destroy) }
  end

  describe "正常にデータが作成されるテスト" do
    let(:user_classification) { create(:user_classification, :customer) }
    let(:user) { create(:user, user_classification: user_classification) }
    let(:order) { create(:order, user: user) }
    it "order が存在する" do
      expect(order).to be_valid
    end
  end

  describe "shipment_status参照のテスト" do
    let(:shipment_status) { create(:shipment_status, shipment_status_name: "準備中") }
    context "order_details.shipment_status が 準備中 のとき" do
      it "true が返される" do
        expect(shipment_status.shipment_status_name).to eq "準備中"
      end
    end

    context "order_details.shipment_status に 発送済 が含まれるとき" do
      let(:shipment_status_shipped) { create(:shipment_status, shipment_status_name: "発送済") }
      it "false が返される" do
        expect(shipment_status && shipment_status_shipped).not_to eq "準備中"
      end
    end
  end
end
