require 'rails_helper'

feature "angular test" do 
  let(:user) { User.create!(email: "bob@shine.com", password: "password123", password_confirmation: "password123") }

  scenario "Our Angular Test App is working" do 
    visit "/"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit "/angular_test"

    expect(page).to have_content("Name")

    fill_in "name", with: "Bob"
    within "header h1" do 
      expect(page).to have_content("Hello, Bob")
    end
  end
end