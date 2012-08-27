module OkadminsHelper
  
  def post_author(post)
    if post.posted_by
       return post.posted_by.name
    else
      return current_admin.name
    end
  end

  def comment_author(comment)
    if comment.commented_by
       return comment.commented_by.name
    end
    t("unknown_user")
  end
end
