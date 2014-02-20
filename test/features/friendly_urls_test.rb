require "test_helper"

feature "As a developer I want friendly urls so that I can have better SEO" do
  scenario %q{posts should have friendly urls contain the word 'posts' and the 
    post's hyphen-delimited title, but not the posts id} do
    visit post_path(posts(:cr))    
    page.current_url.wont_include posts(:cr).id.to_s
    page.current_url.must_include "posts/"
    posts(:cr).title.downcase.split(' ').each do |word_in_title|
      page.current_url.must_include word_in_title
    end
  end

  scenario %q{posts should have friendly urls that update when the title
    is updated but still honor old urls; the old url should redirect
    to the new url'} do
    sign_in
    visit blog_path
    click_on posts(:cr).title
    old_path = page.current_path
    visit edit_post_path(posts(:cr))
    fill_in "Title", with: "new title"
    click_on "Update Post"
    visit blog_path
    click_on "new title"
    page.current_url.must_include "new-title"
  end
end
