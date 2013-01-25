#categories = BusinessCategory.unscoped.order("id ASC")
#File.open("config/locales/bussiness_category.all.t","w:utf-8") do |f|
#  categories.each_with_index do |c,i|
#    f.puts("#{c.en_name}\##{c.display_name}\##{c.search_keyword}")
#  end
#end

def dump_clients(clients, f)
  clients.each_with_index do |c,i|
    bc = c.business_category
    bc_name = bc.present? ? bc.en_name : ""
    bp = c.business_profile
    f.puts("#{c.business_name}\##{c.business_address}\##{c.business_abn}\##{c.business_url}\##{c.business_phone}\##{c.business_fax}\##{c.business_email}\##{c.contact_name}\##{bc_name}\##{c.search_keyword}\##{bp.head}\##{bp.body}")
  end
end

ActiveRecord::Base.establish_connection(:development_0123)
clients = BusinessClient.unscoped.order("id ASC")
File.open("config/locales/bussiness_client_0123.all.t","w:utf-8") do |f|
  dump_clients(clients, f)
end

ActiveRecord::Base.establish_connection(:development)
clients = BusinessClient.unscoped.order("id ASC")
File.open("config/locales/bussiness_client.all.t","w:utf-8") do |f|
  dump_clients(clients, f)
end