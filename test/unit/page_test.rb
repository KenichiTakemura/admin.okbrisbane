require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "page" do
    Page::PAGES.each do |key, value|
      Page.create(:name => value)
    end
    Page::PAGES.each do |key, value|
      assert Page.find_by_name(value), "#{value} not found"
    end
  end
end
