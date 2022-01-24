feature 'user can view a listing' do
  xscenario 'user opens a listing' do
    space = Space.create(
      name: 'House', 
      description: 'Pretty House', 
      price_per_day: "1001", 
      available_from: '2022-01-01',
      available_to: '2022-12-31',
      user_id: '2'
      )
    visit '/listings'
    click_on 'See more'
    expect(current_path).to eq "/listing/#{space.id}"
    expect(page).to have_content "House"
    expect(page).to have_content "Pretty House"
    expect(page).to have_content "Available from: 01 Jan 22"
    expect(page).to have_content "Available until: 31 Dec 22"
    expect(page).to have_button 'Book'
  end
end