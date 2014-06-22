require "test_helper"

feature %q{As an owner I want to see all published and unpublished posts} do
  background do
    sign_in_as_owner
    @own_unpublished_post = create(:post, author: @user, published: false)
    @own_published_post = create(:post, author: @user, published: true)
  end
  scenario "owner can see all published and unpublished posts in the post index" do
    visit blog_path
    page.text.must_include @own_unpublished_post.title
    page.text.must_include @own_published_post.title
  end
end 

feature "As a visitor I only want to see published posts in the post index" do
  background do
    @unpublished_post = create(:post, published: false)
  end
  scenario "visitor cannot see unpublished posts" do
    visit blog_path
    page.text.wont_include @unpublished_post.title
  end
end 