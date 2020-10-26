require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create(username: "funbucket13", password: "test")

    visit "/"

    click_on "I already have an account"

    expect(current_path).to eq('/login')

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq('/')

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_link("Log out")
    expect(page).to_not have_link("Register as a User")
    expect(page).to_not have_link("I already have an account")
  end

  it "cannot log in with bad credentials" do
    user = User.create(username: "funbucket13", password: "test")

    visit "/"

    click_on "I already have an account"

    fill_in :username, with: user.username
    fill_in :password, with: "incorrect password"

    click_on "Log In"

    expect(current_path).to eq('/login')

    expect(page).to have_content("Sorry, your credentials are bad.")
  end

  it "can logout a user" do
    user = User.create(username: "funbucket13", password: "test")

    visit "/"

    click_on "I already have an account"

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq('/')

    save_and_open_page

    click_on "Log out"

    expect(page).to have_content('Register as a User')
  end
end
