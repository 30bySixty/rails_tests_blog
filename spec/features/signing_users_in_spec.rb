require "rails_helper"

RSpec.feature "Users sign in" do
  
  before do
    @john = User.create!(email: "john@example.com", password: "password")
  end

  scenario "with valid credentials" do
    visit "/"
    
    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log In"
    
    expect(page).to have_content("You have signed in.")
    expect(page).to have_content("You are signed in as #{@john.email}")
  end
end