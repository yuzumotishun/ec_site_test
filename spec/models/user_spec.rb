require "rails_helper"

RSpec.describe User, type: :model do
  describe "" do
    context "データが条件を満たすとき" do
      it "保存できない" do
        user = User.new(email: "test@example.com")
        expect(user.valid?).to eq false
      end
    end

    it { should validate_presence_of(:email) }
  end
end
