require 'space'

describe Space do
  describe '.create' do
    it 'creates a space with name, description and price' do
      Space.create(name: 'Luxury resort', description: 'Pleasant flats by the beach', price: "100")
      expect(Space.all[0].name).to eq 'Luxury resort' 
      expect(Space.all[0].description).to eq 'Pleasant flats by the beach'
      expect(Space.all[0].price).to eq "100"
    end
  end
end

