require "rails_helper"

RSpec.describe Product, type: :model do
  describe "association" do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
    it { should belong_to(:sale_status) }
    it { should belong_to(:product_status) }
    it { should have_many(:purchases).dependent(:destroy) }
  end
end
