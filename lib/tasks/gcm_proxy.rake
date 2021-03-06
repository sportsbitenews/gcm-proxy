namespace :gcm_proxy do
  
  desc 'Deliver notifications from the cache to GCM'
  task :worker => :environment do
    GcmProxy::Worker.run
  end
  
  desc 'Setup the initial admin user'
  task :setup => :environment do
    if User.all.empty?
      User.create(:name => 'Admin User', :email_address => 'admin@example.com', :username => 'admin', :password => 'password', :password_confirmation => 'password')
      puts
      puts "    A default admin user has been created with the following details:"
      puts
      puts "    Username...: #{'admin'.green}"
      puts "    Password...: #{'password'.green}"
      puts
    else
      puts "Your database already has users in it therefore there's no need to setup."
    end
  end
  
end
