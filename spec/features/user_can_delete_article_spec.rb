require "rails_helper"

describe "Deleting an article" do
  context "from the show page" do
    it "displays all articles without the deleted entry" do

    article1 = Article.create!(title: "Title1", body: "Body1")
    article1 = Article.create!(title: "Title2", body: "Body2")

    visit article_path(article1)

    expect(page).to have_content "Title1"
    expect(page).to have_content "Body1"
    expect(page).to have_link "Delete"

    click_link "Delete Article"

    expect(page).to_not have_content "Title1"
    expect(page).to_not have_content "Body1"
    expect(page).to have_content "Title2"
    expect(page).to have_content "Body2"

    expect(current_path).to eq articles_path
    end
  end
end
