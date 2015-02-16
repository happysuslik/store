require 'features/features_spec_helper'

feature "Registration" do
  scenario "Visitor registers successfully via register form" do
    visit '/users/sign_up'
    within '#new_user' do
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_button('Sign up')
    end
    expect(page).not_to have_content 'Sign up'
    expect(page).to have_content 'Logout'
    expect(page).to have_content 'Signed in successfully.'
  end
end