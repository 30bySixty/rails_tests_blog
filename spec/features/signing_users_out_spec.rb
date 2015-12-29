require "rails_helper"


RSpec.feature "Signing out signed-in users" do
    
    before do
        @john = User.create!(email: "john@example.com", password: "password")
        visit "/"
        
        click_link "Sign in"
        fill_in "Email", with: @john.email
        fill_in "Password", with: @john.password
        click_button "Log In"
    end
    
    scenario "A signed in user signs out" do 
        visit "/"
        click_link "Log out"
        expect(page).to have_content ("You have successfully signed out.")
    end
end