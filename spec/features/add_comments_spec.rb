require 'spec_helper'

describe 'adding comments to a post' do
  
  before do
    login
    create(:post)
  end

  it 'adds comments from a form providing Text' do
    visit '/posts'
    click_link 'Add comment'

    fill_in 'Text', with: 'This article is great'
    click_button 'Create Comment'

    expect(page).to have_content 'This article is great'
  end

end