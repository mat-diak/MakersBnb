feature 'signing up' do
  xscenario 'users signs up' do
    visit '/'
    click_on 'Sign up'
    fill_in 'name', with: 'Mat'
    fill_in 'username', with: 'mat100'
    fill_in 'email', with: 'mat100@gmail.com'
    fill_in 'password', with: '12345'

    expect(page).to have_content 'You are signed in as Mat'
  end
end