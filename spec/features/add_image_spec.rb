require 'spec_helper'

describe 'uploading photos' do

  before do
    login
  end
  
  it 'allows me to attach a photo on the new post form' do
    visit '/posts/new'

    fill_in 'Title', with: 'My cool photo'
    attach_file 'Image', Rails.root.join('spec/images/house.jpg')
    click_button 'Create Post'

    expect(page).to have_css 'img.instagram-upload'
  end
end