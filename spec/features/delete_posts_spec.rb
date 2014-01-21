require 'spec_helper'

describe 'deleting a post' do
  
  before do
    create(:post)
  end

  it 'removes the post permanently' do
    visit '/posts'
    click_link '✖'

    expect(page).not_to have_content 'Hello'
  end
end