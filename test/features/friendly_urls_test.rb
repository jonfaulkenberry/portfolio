require "test_helper"

feature "As a search engine I want friendly urls for posts" do
  background do
    @post = create(:post)
  end
  scenario %q{posts should have a slug equal to its hypen delimited title } do
    @post.slug.must_equal @post.title.gsub(' ', '-')
  end
  scenario %q{posts should have friendly urls containing the word 'posts' and 
    the post's slug, but not the posts id} do
    visit post_path(@post)    
    page.current_path.wont_equal "/posts/" + @post.id.to_s
    page.current_path.must_equal "/posts/" + @post.slug
  end
  scenario %q{posts should have friendly urls that update when the title
    is updated but still honor old urls; the old url should redirect
    to the new url'} do
    sign_in_as_owner
    prev_post_path = post_path(@post)
    prev_post_slug = @post.slug
    post_id = @post.id
    visit edit_post_path(@post)
    fill_in "Title", with: Forgery(:lorem_ipsum).words(10, :random => true)
    click_on "Update Post"
    page.has_content? "Post was successfully updated."
    @post = Post.find(post_id)
    page.current_path.wont_include prev_post_slug
    # Test updated path
    page.current_path.must_include @post.slug
    # Test previous path
    visit prev_post_path
    page.current_path.wont_include prev_post_slug
  end
end

feature "As a search engine I want friendly urls for projects" do
end
