describe "the delete an exercise process" do
  it "deletes an exercise", js: true do
    user = FactoryGirl.create(:user)
    visit users_path
    login_as(user, :scope => :user)
    click_link user.name
    click_on 'Add Exercise'
    fill_in 'Description', :with => 'run'
    fill_in 'Burned', :with => 200
    click_on 'Create Exercise'
    click_link 'Delete Exercise'
    expect(page).to have_no_content('run')
  end

end
