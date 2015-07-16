require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "the edit a exercise process" do
  it "adds a food", js: true do
    user = FactoryGirl.create(:user)
    visit users_path
    login_as(user, :scope => :user)
    click_link user.name
    click_on 'Add Exercise'
    fill_in 'Description', :with => 'run'
    fill_in 'Burned', :with => 200
    click_on 'Create Exercise'
    click_link 'Edit'
    fill_in 'Description', :with => 'walk'
    fill_in 'Burned', :with => 100
    click_on 'Update Exercise'
    expect(page).to have_content 'walk'
  end

  it "errors if fields left blank", js: true do
      user = FactoryGirl.create(:user)
      visit users_path
      login_as(user, :scope => :user)
      click_link user.name
      click_on 'Add Exercise'
      fill_in 'Description', :with => 'run'
      fill_in 'Burned', :with => 200
      click_on 'Create Exercise'
      click_link 'Edit'
      fill_in 'Description', :with => ''
      fill_in 'Burned', :with => nil
      click_on 'Update Exercise'
    expect(page).to have_content 'errors'
  end
end
