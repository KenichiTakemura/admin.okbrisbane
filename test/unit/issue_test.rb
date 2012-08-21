require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  
  test "add an issue" do
    i = Issue.new(:description => description)
    assert i.save
    assert_equal(i.status,Okvalue::ISSUE_NEW)
    assert_equal(Issue.first.status,Okvalue::ISSUE_NEW)
  end
  
  test "status" do
    i = Issue.new(:description => description)
    assert i.save
    assert i.assigned
    assert_equal(Issue.first.status,Okvalue::ISSUE_ASSIGNED)
    assert i.on_qa
    assert_equal(Issue.first.status,Okvalue::ISSUE_ONQA)
    assert i.closed
    assert_equal(Issue.first.status,Okvalue::ISSUE_CLOSED)
    assert i.reopen
    assert_equal(Issue.first.status,Okvalue::ISSUE_REOPEN)
  end
  
end
