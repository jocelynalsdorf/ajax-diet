require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "the add a food process" do
  it "adds a food", js: true do
    user = FactoryGirl.create(:user)
    visit users_path
    login_as(user, :scope => :user)
    click_link user.name
    click_on 'Add Food'
    fill_in 'Food name', :with => 'milk'
    fill_in 'Calories', :with => 200
    click_on 'Create Food'
    expect(page).to have_content 'milk'
  end

  it "errors if fields left blank", js: true do
    user = FactoryGirl.create(:user)
    visit users_path
    login_as(user, :scope => :user)
    click_link user.name
    click_on 'Add Food'
    fill_in 'Food name', :with => ''
    fill_in 'Calories', :with => nil
    click_on 'Create Food'
    expect(page).to have_content 'errors'
  end
end
