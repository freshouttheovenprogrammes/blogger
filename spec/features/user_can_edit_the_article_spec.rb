require 'rails_helper'

describe "As a user" do
  context "when I am on the article show page" do
    it "I can edit the article" do
      article = Article.create!(title: "Article1", body: "This is the article body")

      visit article_path(article)

      expect(page).to have_link("Edit")

      click_link "Edit"

      fill_in "article[title]", with: "FancyThing"
      fill_in "article[body]", with: "This is a brand new body baby"

      click_on "Update Article"

      expect(current_path).to eq article_path(article)
      expect(page).to have_content "FancyThing"
      expect(page).to have_content "This is a brand new body baby"
    end
  end
end
