require 'rails_helper'

feature 'User signs up' do
  before do
    visit new_user_registration_path
    fill_in 'Email', with: 'example_user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
  end

  scenario 'with valid information', js: true do
    fill_in 'Name', with: 'Ryan Larson'
    click_on 'Sign up'
    expect(page).to have_content 'bank account information'
  end

  scenario 'with missing information', js: true do
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end
end

feature "User signs in" do
  subject { page }

  context "with unverified account", :vcr do
    before do
      user = create(:user)
      subscription = FactoryGirl.create(:subscription)
      user.subscription = subscription
      sign_in user
    end

    it { should have_content "First deposit amount" }
  end

  context "with verified account", :vcr do
    before do
      user = create(:user)
      subscription = FactoryGirl.create(:subscription, verified: true)
      user.subscription = subscription
      sign_in user
    end

    it { should have_content "Your payments" }
  end
end
