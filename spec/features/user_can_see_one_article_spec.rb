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
      expect(page).to have_content("2")
    end
  end
end

describe "they fill in a comment form" do
  it "displays the comment on the article show" do
    article = Article.create!(title: "New title", body: "New Body")

    visit article_path(article)

    fill_in "comment[author_name]", with: "ME!"
    fill_in "comment[body]", with: "Thots on da article"
    click_on "Submit"

    expect(current_path).to eq(article_path(article))
    expect(page).to have_content("Post a Comment")
    expect(page).to have_content("ME!")
    expect(page).to have_content("Thots on da article")
  end
end
