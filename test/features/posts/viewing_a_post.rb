require "test_helper"

feature %q{As an owner I want to see all published and unpublished posts 
  regardless of author} do
  background do
    sign_in_as_owner
    @another_user = create(:author)
    @own_unpublished_post = create(:post, author: @user, published: false)
    @own_published_post = create(:post, author: @user, published: true)
    @other_users_unpublished_post = create(:post, author: @another_user, published: false)
    @other_users_published_post = create(:post, author: @another_user, published: true)    
  end
  scenario "owner can see all published and unpublished posts regardless of author" do
    visit post_path(@own_unpublished_post)
    page.text.must_include @own_unpublished_post.title
    visit post_path(@own_published_post)
    page.text.must_include @own_published_post.title
    visit post_path(@other_users_unpublished_post)
    page.text.must_include @other_users_unpublished_post.title
    visit post_path(@other_users_published_post)
    page.text.must_include @other_users_published_post.title
  end
end 

feature "As an author I want to see my own unpublished posts" do
  background do
    sign_in_as_author
    @another_user = create(:author)
    @own_unpublished_post = create(:post, published: false, author: @user)
    @other_users_unpublished_post = create(:post, author: @another_user, published: false)
  end
  scenario "author can only see own unpublished posts" do
    visit post_path(@own_unpublished_post)
    page.text.must_include @own_unpublished_post.title
    visit post_path(@other_users_unpublished_post)
    page.text.wont_include @other_users_unpublished_post.title
  end
end

feature "As a visitor I only want to see published posts" do
  background do
    @unpublished_post = create(:post, published: false)
  end
  scenario "visitor cannot see unpublished posts" do
    visit post_path(@unpublished_post)
    page.text.wont_include @unpublished_post.title
  end
end 