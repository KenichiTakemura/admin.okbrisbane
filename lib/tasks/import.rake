Dir.glob(File.join(Rails.root, 'db', 'import', '*.rb')).each do |file|
  desc "Import data from legacy okbrisbane with db/import/#{File.basename(file)}."
  task "db:import:#{File.basename(file).gsub(/\..+$/, '')}" => :environment do
    load(file)
  end
end
