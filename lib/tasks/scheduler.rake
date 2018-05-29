desc "This task is called by the Heroku scheduler add-on"

task :checking_requests => :environment do
  Request.checker
end


