#categories = BusinessCategory.unscoped.order("id ASC")
#File.open("config/locales/bussiness_category.all.t","w:utf-8") do |f|
#  categories.each_with_index do |c,i|
#    f.puts("#{c.en_name}\##{c.display_name}\##{c.search_keyword}")
#  end
#end

def dump_categories(categories, f)
  categories.each_with_index do |bc,i|
    f.puts("#{bc.en_name}\##{bc.display_name}\##{bc.search_keyword}")
  end
end

ActiveRecord::Base.establish_connection(:development_0123)
clients = BusinessCategory.unscoped.order("id ASC")
File.open("config/locales/business_category.dump.t","w:utf-8") do |f|
  dump_categories(clients, f)
end