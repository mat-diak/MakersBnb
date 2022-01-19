feature 'Creating a new space' do
  scenario 'User can add a new space on MakersBnB' do
    visit '/new'
    fill_in 'name', with: 'Luxury resort'
    fill_in 'description', with: 'Pleasant flats by the beach'
    fill_in 'price_per_day', with: '100'
    click_button 'List a space'
    expect(page).to have_content('Luxury resort')
    expect(page).to have_content('Pleasant flats by the beach')
    expect(page).to have_content('100')
  end
end


    

