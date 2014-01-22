require 'spec_helper'

describe Post do
  it 'can be tagged with tags' do
    post = create(:post, :tag_names => 'amazing, remote')
    expect(post.tags.count).to eq(2)
  end

  it 'will reuse tags if they already exist' do
    post = create(:post, :tag_names => 'amazing, remote')
    another_post = create(:post, :tag_names => 'amazing, solitary')
    expect(Tag.count).to eq(3)
  end

  specify 'spaces between commas are optional' do
    post = create(:post, :tag_names => 'amazing,remote,winter')
    expect(post.tags.count).to eq(3)
  end

  it 'formats the tag name to remove special characters and make it lowercase' do
    post = create(:post, :tag_names => '#AmazIng')
    expect(post.tags.first.name).to eq('amazing')
  end
end
