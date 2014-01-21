require 'spec_helper'

describe 'filter by tags' do
  
  it 'can filter by clicking on a tag' do
    tag = create(:tag, :name => 'brilliant')

    tagged_post = create(:post, :title => 'A post')
    another_post = create(:post, :title => 'Another post')

    tagged_post.tags << tag

    visit '/posts'
    click_link '#brilliant'

    expect(page).to have_content('A post')
    expect(page).not_to have_content('Another post')

  end

end