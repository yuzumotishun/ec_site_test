require "rails_helper"

RSpec.describe Order, type: :model do
  describe "正しくデータが入力されているとき" do
    let(:user_classification) { create(:user_classification) }
    let(:user) { create(:user, user_classification: user_classification) }
    it "order が作成される" do
      order = build(:order, user: user)
      expect(order).to be_valid
    end
  end
end
