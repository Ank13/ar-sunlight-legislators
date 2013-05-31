require_relative '../db/config'

def state_pols(state)
  senators = Politician.where("state = ?", state).where("title = ?", 'Sen')
  puts "Senators:"
  senators.each {|pol| puts "   #{pol.first_name} #{pol.last_name} (#{pol.party})"}
  reps = Politician.where("state = ?", state).where("title = ?", 'Rep')
  puts "Representatives:"
  reps.each {|pol| puts "   #{pol.first_name} #{pol.last_name} (#{pol.party})"}
end

def gender_tracker(gender)
  senators = Politician.where("gender = ?", gender).where("title = ?", 'Sen').where("in_office = ?", 1)
  puts "#{gender.capitalize} Senators: #{senators.count} (#{senators.count}%)"
  reps = Politician.where("gender = ?", gender).where("title = ?", 'Rep').where("in_office = ?", 1)
  puts "#{gender.capitalize} Representatives: #{reps.count} (#{(reps.count/435.0*100.0).round(1)}%)"
end

def rep_quant(*args)
   args.each do |state|
     sens = Politician.where("state = ?", state).where("title = ?", 'Sen').where("in_office = ?", 1).count
     reps = Politician.where("state = ?", state).where("title = ?", 'Rep').where("in_office = ?", 1).count
     puts "#{state}: #{sens} Senators, #{reps} Representative(s)"
   end
end

def totals_in_data
  sens = Politician.where("title = ?", 'Sen').count
  reps = Politician.where("title = ?", 'Rep').count
  puts "Senators: #{sens}"
  puts "Representatives #{reps}"
end

def delete_inactives
  Politician.where("in_office = ?", 0).destroy_all

end


state_pols('CA')
gender_tracker('F')
rep_quant('MA', 'RI', 'IL')
# totals_in_data
delete_inactives
totals_in_data
