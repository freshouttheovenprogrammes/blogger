require 'rails_helper'

describe "As a user" do
  it "I can create a new article" do

    visit articles_path
    click_link "Create a New Article"

    expect(current_path).to eq(new_article_path)

    fill_in "article[title]", with: "New Title!"
    fill_in "article[body]", with: "Some stuff"
    click_on "Create Article"

    expect(page).to have_content "Article: New Title! was created"
    expect(page).to have_content("New Title!")
  end
end
