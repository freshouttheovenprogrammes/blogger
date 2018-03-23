require 'rails_helper'

describe "When I'm at the article show page" do
  context "and I click on an articles tag" do
    it "I arrive at the tag show" do
      tag = Tag.create!(name: "Generic")
      article1 = Article.create!(title: "Article1", body: "Article1 Body", tag_list: "Generic")
      article2 = Article.create!(title: "Article2", body: "Article2 Body", tag_list: "Generic")

      visit article_path(article1)

      click_link "generic"

      expect(current_path).to eq tag_path(tag)
      expect(page).to have_content(article1.title)
      expect(page).to have_content(article2.title)
    end
  end
end
