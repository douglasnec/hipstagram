require 'spec_helper'

describe 'search feature' do
  
  before(:each) do
    user = login
    post = create(:post, user: user)
    post2 = create(:post, user: user, title: 'A second post')
    post3 = create(:post, user: user, title: 'A third post')
  end

  it "should retrieve posts by their title" do
    visit '/'
    fill_in 'search', with: 'second'
    click_button 'Search'

    expect(page).to have_content('second')
    expect(page).not_to have_content('third')
    expect(page).not_to have_content('Hello')
  end



end