require "rails_helper"

RSpec.describe Order, type: :model do
  context "注文を確定する ボタンを押した時" do
    let(:customer) { create(:customer) }
    let(:user) { create(:user, user_classification: customer) }
    fit "order が作成される" do
      order = build(:order, user: user)
      expect(order).to be_valid
    end
  end
end
