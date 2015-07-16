require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "the add an exercise process" do
  it "adds an exercise", js: true do
    user = FactoryGirl.create(:user)
    visit users_path
    login_as(user, :scope => :user)
    click_link user.name
    click_on 'Add Exercise'
    fill_in 'Description', :with => 'run'
    fill_in 'Burned', :with => 300
    click_on 'Create Exercise'
    expect(page).to have_content 'run'
  end

  it "errors if fields left blank", js: true do
    user = FactoryGirl.create(:user)
    visit users_path
    login_as(user, :scope => :user)
    click_link user.name
    click_on 'Add Exercise'
    fill_in 'Description', :with => ''
    fill_in 'Burned', :with => nil
    click_on 'Create Exercise'
    expect(page).to have_content 'errors'
  end
end
