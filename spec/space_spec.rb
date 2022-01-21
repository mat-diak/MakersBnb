require 'space'
require 'database_helpers'

describe Space do
  describe '.create' do
    it 'creates a space with name, description and price' do
      space = Space.create(
      name: 'Luxury resort', 
      description: 'Pleasant flats by the beach', 
      price_per_day: "100", 
      available_from: '2022-01-20',
      available_to: '2022-01-25'
      )
      persisted_data = persisted_data(id: space.id, table: 'spaces')
      
      expect(space).to be_a Space
      expect(space.id).to eq persisted_data.first['id']
      expect(space.name).to eq 'Luxury resort'
      expect(space.description).to eq 'Pleasant flats by the beach'
      expect(space.price_per_day).to eq '100'
      expect(space.available_from).to eq '2022-01-20'
      expect(space.available_to).to eq '2022-01-25'
    end
  end

  describe '.find_by_id' do
    it 'returns space with id' do
      space = Space.create(
        name: 'Luxury resort', 
        description: 'Pleasant flats by the beach', 
        price_per_day: "100", 
        available_from: '2022-01-20',
        available_to: '2022-01-25'
        )
      retrieved_listing = Space.find_by_id(space.id)
      expect(retrieved_listing.id).to eq space.id
      expect(retrieved_listing.name).to eq space.name
      expect(retrieved_listing.description).to eq space.description
      expect(retrieved_listing.price_per_day).to eq space.price_per_day
      expect(retrieved_listing.available_from).to eq space.available_from
      expect(retrieved_listing.available_to).to eq space.available_to
    end
  end
end

