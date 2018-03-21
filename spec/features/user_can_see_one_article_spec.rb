require 'rails_helper'

describe "As a user" do
  context "When I visit the articles index path" do
    it "I can see the individual article" do
      article_1 = Article.create!(title: "title", body: "Lorem ipsum")
      comment_1 = article_1.comments.create!(author_name: "Me", body: "Commentssss")
      comment_2 = article_1.comments.create!(author_name: "You", body: "So much things to say wooowww")

      visit articles_path

      click_link(article_1.title)

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(article_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end
end
