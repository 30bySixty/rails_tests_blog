require 'rails_helper'

RSpec.feature "Creating Articles" do
  #give the feature a scnario
  scenario "A user creates a new article" do
    #what is the first thing that's going to happen?
    #1. visit root url
    visit "/"
    
    click_link "New Article"
    
    fill_in "Title", with: "Creating first article"
    fill_in "Body", with: "Lorem Ipsum"
    click_button "Create Article"
    
    #expect the page to have success content
    expect(page).to have_content("Article successfully created")
    expect(page.current_path).to eq(articles_path)
  end
end