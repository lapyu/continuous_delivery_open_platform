require_relative "boot"
require 'bitbucket_rest_api'

opts = Trollop::options do
  opt :user, "Bitbucket Username", :short => "u", :type => String
  opt :pass, "Bitbucket Password", :short => "p", :type => String
  opt :owner, "Bitbucket Project Owner", :short => "o", :type => String
  opt :project, "Bitbucket Project", :short => "j", :type => String
  opt :extension, "extension", :short => "e", :type => String
end

bitbucket = BitBucket.new login: "#{opts[:user]}", password: "#{opts[:pass]}"

bitbucket.repos.create name: "#{opts[:project]}#{opts[:extension]}", is_private: true, owner: "#{opts[:owner]}"
