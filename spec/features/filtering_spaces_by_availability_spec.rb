feature 'filtering spaces by availabiltiy' do
  scenario 'user picks 2 dates, they see available spaces' do
    available_space_1 = Space.create(
      name: 'Available_1', 
      description: 'Description_1', 
      price_per_day: "1001", 
      available_from: '2022-01-01',
      available_to: '2022-12-31'
      )
    available_space_2 = Space.create(
      name: 'Available_2', 
      description: 'Description_2', 
      price_per_day: "1002", 
      available_from: '2022-03-01',
      available_to: '2022-10-31'
      )
    unavailable_space_1 = Space.create(
      name: 'Unavailable_1', 
      description: 'Description_3', 
      price_per_day: "1003", 
      available_from: '2022-03-01',
      available_to: '2022-03-31'
      )
    unavailable_space_2 = Space.create(
      name: 'Unavailable_2', 
      description: 'Description_4', 
      price_per_day: "1004", 
      available_from: '2022-05-01',
      available_to: '2022-05-31'
      )
    #act
    visit '/listings'
    fill_in('requested_from', with: '2022-04-01')
    fill_in('requested_until', with: '2022-04-30')
    click_on 'Show available spaces'
    # pick 2 dates
    #assert
    # expect(current_path).to eq '' #we need some PATH
    expect(page).to have_content ('Available_1') 
    expect(page).to have_content ('Available_2') 
    expect(page).not_to have_content ('Unvailable_1') 
    expect(page).not_to have_content ('Unavailable_2') 
    expect(page).to have_content ('Description_1') 
    expect(page).to have_content ('Description_2') 
    expect(page).not_to have_content ('Description_3') 
    expect(page).not_to have_content ('Description_4') 
    expect(page).to have_content ('£1001 per night') 
    expect(page).to have_content ('£1002 per night') 
    expect(page).not_to have_content ('£1003 per night') 
    expect(page).not_to have_content ('£1004 per night') 
    # we only wanna see the 2 available listings
    
  end
end

# feature:
#      - user goes to our listings page
#      - they pick 2 dates
#      - they are given available listings