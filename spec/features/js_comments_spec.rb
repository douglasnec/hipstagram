require 'spec_helper'


describe 'loading comments' do
  
  it 'should load comments with ajax when I click on Show comments button' do
    login
    post = create(:post, :id => 1)
    comment = create(:comment, :post => post)

    visit '/posts/1'
    click_link('Show comments')
    expect(page).to have_content('My comment')
  end
end