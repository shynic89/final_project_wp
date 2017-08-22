namespace :slurp do
  desc "TODO"
  task firms: :environment do
  require "csv"

csv_text = File.read(Rails.root.join("lib", "csvs", "test_firms.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
t = Firm.new
  t.name = row["name"]
  t.address = row["address"]
  t.city = row["city"]
  t.state = row["state"]
  t.category = row["category"]
  t.mappable_address = row["mappable address"]
  t.save
end
  end

end
