feature 'Test' do
    scenario 'initial page setup' do
        visit '/'
        expect(current_path).to eq '/listings'
    end
end