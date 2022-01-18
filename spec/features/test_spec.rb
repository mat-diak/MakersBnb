feature 'Test' do
    scenario 'initial page setup' do
        visit '/'
        expect(page).to have_content('Hello world!')
    end
end