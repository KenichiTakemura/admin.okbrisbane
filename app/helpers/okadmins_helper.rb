module OkadminsHelper
  
  def post_author(post)
    if post.posted_by
       return post.posted_by.name
    else
      return current_admin.name
    end
  end

end
