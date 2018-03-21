require 'rails_helper'

describe Tag, type: :model do
  describe "relationships" do
    it {should have_many(:taggings)}
    it {should have_many(:articles).through(:taggings)}
  end
  describe "validations" do
    it {should validate_presence_of(:name)}
  end
end
