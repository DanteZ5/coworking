desc "This task is called by the Heroku scheduler add-on"

task :checking_requests => :environment do
  puts "check requests"
  Request.checker
  puts "done"
end


