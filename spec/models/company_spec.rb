require 'rails_helper'

RSpec.describe Company, type: :model do
  context "when saving a company" do
    it "has a valid factory" do
      expect(build(:company)).to be_valid
    end

    it "is invalid when no name provided" do
      company = build(:company, name: nil)
      company.valid?
      expect(company.errors[:name].any?).to eq(true)
    end
  end
end
