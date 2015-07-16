describe "the delete a food process" do
  it "deletes a food", js: true do
    user = FactoryGirl.create(:user)
    visit users_path
    login_as(user, :scope => :user)
    click_link user.name
    click_on 'Add Food'
    fill_in 'Food name', :with => 'milk'
    fill_in 'Calories', :with => 200
    click_on 'Create Food'
    click_link 'Delete Food'
    expect(page).to have_no_content('milk')
  end

end
