feature 'checks if has access to routies defined in user controller' do
  scenario 'opens a user route' do
    visit '/login'
    click_on 'Log in'
  end
end