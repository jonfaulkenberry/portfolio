module PostHelper
  def post_tag_list(post)
    post.tag_list.map{ |t| link_to t, post_tag_path(t) }.join( ', ')
  end
end
