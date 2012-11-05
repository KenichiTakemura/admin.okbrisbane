Dir.glob(File.join(Rails.root, 'db', 'export', '*.rb')).each do |file|
  desc "Export data from legacy okbrisbane into db/export/#{File.basename(file)}."
  task "db:export:#{File.basename(file).gsub(/\..+$/, '')}" => :environment do
    load(file)
  end
end
