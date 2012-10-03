class IssueMailer < ActionMailer::Base
  default :from => "OKBRISBANE <do_no_reply@okbrisbane.com>"
  
  def send_new_issue(issue, category)
    to = SystemConfig.instance.issue_report_to
    subject = "[New Issue for OKBRISBANE]"
    logger.info("email is besing sent to #{to}")
    @issue = issue
    @category = category
    mail(:to => to,
         :subject => subject)
  end

end
