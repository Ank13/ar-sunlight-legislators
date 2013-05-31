require 'csv'

class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    ignore_array = ["middle_name","nickname","district","webform","congress_office","bioguide_id","votesmart_id","fec_id","govtrack_id","crp_id","","congresspedia_url","youtube_url","facebook_id","official_rss","senate_class","birthdate"]
    csv.each do |row|
      politican_attributes = Hash.new  #create one per politician
      row.each do |field, value|
        next if ignore_array.include?(field)
        politican_attributes[field.to_sym] = value #capture all from csv
      end

      Politician.create(politican_attributes) #create politician with hash args
    end
  end
end

# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
