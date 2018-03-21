require 'rails_helper'

describe Comment, type: :model do
  context "validations" do
    it {should belong_to(:article)}
  end
end
