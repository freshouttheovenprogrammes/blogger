require 'rails_helper'

describe "As a user" do
  context "When I visit the articles index path" do
    it "I can see the individual article" do
      article_1 = Article.create!(title: "title", body: "Lorem ipsum")

      visit '/articles'

      click_link(article_1.title)

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
    end
  end
end
