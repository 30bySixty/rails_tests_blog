require 'rails_helper'

RSpec.feature "Creating Articles" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
      
    visit "/"
    
    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log In"
  end
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
    expect(page).to have_content("Article successfully created.")
    expect(page.current_path).to eq(articles_path)
  end
  
  scenario "A user fails to create a new article" do 
    visit "/"
    
    click_link "New Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Create Article"
    
    expect(page).to have_content("There was an error.")
    expect(page).to have_content("Title cannot be blank.")
    expect(page).to have_content("Body cannot be blank.")
  end
end