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
end
