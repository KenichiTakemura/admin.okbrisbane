class IssuesController < PostsController

  @@management_path = "issues_managements"  

  def create
    _create(Issue, :issue)
  end
  
  def update
    _update(Issue, :issue)
  end
  
end