require "rails_helper"

RSpec.feature "Edit an Article" do
  
  before do
    @article = Article.create(title: "First Article", body: "Body of the first article.")
    @john = User.create!(email: "john@example.com", password: "password")
      
    visit "/"
    
    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log In"
  end
  
  scenario "A user updates an article" do
    visit "/"
    
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: "Updated article"
    fill_in "Body", with: "Updated body of article"
    
    click_button "Update Article"
    
    expect(page).to have_content("Article has been updated.")
    #want user to stay on article page once article has been updated
    expect(page.current_path).to eq(article_path(@article))
  end
  
  scenario "A user fails to update an article" do 
    visit "/"
    
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    
    click_button "Update Article"
    
    expect(page).to have_content("Article has not been updated.")
    expect(page.current_path).to eq(article_path(@article))
  end
end