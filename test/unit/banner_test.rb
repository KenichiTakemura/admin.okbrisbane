require 'test_helper'

class BannerTest < ActiveSupport::TestCase
  def setup
    Page::PAGES.each do |key, value|
      Page.create(:name => value)
    end
  end

  test "add a banner" do
    page = Page.find_by_name(Page::PAGES[:top])
    banner = Banner.new(:place => 'top right')
    banner.paged_in(page)
    assert banner.save
  end

end
