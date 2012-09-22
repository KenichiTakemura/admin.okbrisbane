class IssuesController < PostsController

  @@management_path = "issues_managements"  

  def create
    _create(Issue, :issue)
    IssueMailer.send_new_issue(@post, @category).deliver
  end
  
  def update
    _update(Issue, :issue)
  end
  
end