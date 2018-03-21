require "rails_helper"

describe "Deleting an article" do
  it "from the show page" do
    article = Article.create!(title: "Title1", body: "Body1")

    visit article_path(article)

    expect(page).to have_content "Title1"
    expect(page).to have_content "Body1"
    expect(page).to have_link "Delete Article"

    click_link "Delete Article"

    expect(page).to_not have_content "Title1"
    expect(page).to_not have_content "Body1"
    
    expect(current_path).to eq articles_path
  end
end
