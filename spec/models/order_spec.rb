require "rails_helper"

RSpec.describe Order, type: :model do
  describe "association" do
    it { should belong_to(:user) }
    it { should have_many(:order_details).dependent(:destroy) }
  end

  context "注文を確定する ボタンを押した時" do
    let(:customer) { create(:customer) }
    let(:user) { create(:user, user_classification: customer) }
    let(:order) { create(:order, user: user) }
    it "order が作成される" do
      expect(order).to be_valid
    end
  end

  describe "def shipment_prepared?" do
    let(:customer) { create(:customer) }
    let(:user) { create(:user, user_classification: customer) }
    let(:order) { create(:order, user: user) }
    let(:category) { create(:category) }
    let(:sale_status) { create(:sale_status) }
    let(:product_status) { create(:product_status) }
    let(:product) { create(:product, user: user, category: category, sale_status: sale_status, product_status: product_status) }
    let(:shipment_status) { create(:shipment_status, :preparation) }
    let(:order_detail) { create(:order_detail, order: order, shipment_status: shipment_status, product: product) }
    context "order_details.shipment_status が全て 準備中 のとき" do
      it "true が返される" do
        expect(order_detail.shipment_status.shipment_status_name).to eq "準備中"
      end
    end

    context "order_details.shipment_status に 発送済 が含まれるとき" do
      let(:shipment_status) { create(:shipment_status, :shipped) }
      it "false が返される" do
        expect(order_detail.shipment_status.shipment_status_name).not_to eq "準備中"
      end
    end
  end
end
