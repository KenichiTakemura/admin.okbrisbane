class IssuesController < PostsController

  @@management_path = "issues_managements"  

  def create
    IssueMailer.send_new_issue(@post, @category).deliver if _create(Issue, :issue)
  end
  
  def update
    _update(Issue, :issue)
  end
  
end