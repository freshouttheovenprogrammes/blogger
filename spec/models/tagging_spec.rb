require 'rails_helper'

describe Tagging, type: :model do
  describe "relationships" do
    it {should have_many(:tags)}
    it {should have_many(:articles)}
  end
end
