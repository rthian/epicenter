require 'rails_helper'

describe CreditCard do
  it { should belong_to :user }
  it { should have_many :payments }
  it { should validate_presence_of :credit_card_uri }
  it { should validate_presence_of :user_id }

  describe "#fetch_balanced_account" do
    it "returns the balanced credit card object", :vcr do
      credit_card = FactoryGirl.create :credit_card
      expect(credit_card.fetch_balanced_account.href).to eq credit_card.credit_card_uri
    end
  end

  describe "#calculate_charge" do
    it "returns the amount given plus credit card fees", :vcr do
      credit_card = FactoryGirl.create :credit_card
      expect(credit_card.calculate_charge(600_00)).to eq 618_21
    end
  end
end