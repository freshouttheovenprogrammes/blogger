require "rails_helper"

describe "Deleting an article" do
  context "from the show page" do
    it "displays all articles without the deleted entry" do

    article1 = Article.create!(title: "Title1", body: "Body1")
    article2 = Article.create!(title: "Title2", body: "Body2")

    visit article_path(article1)

    expect(page).to have_content article1.title
    expect(page).to have_content article1.body
    expect(page).to have_link "Delete"

    click_link "Delete"

    expect(page).to have_content "Article: Title1 was destroyed"
    expect(current_path).to eq articles_path
    expect(page).to_not have_content article1.body
    expect(page).to have_content article2.title
    expect(page).to have_content article2.body
    end
  end
end
