require_relative "boot"
require 'bitbucket_rest_api'

opts = Trollop::options do
  opt :user, "Bitbucket Username", :short => "u", :type => String
  opt :pass, "Bitbucket Password", :short => "p", :type => String
  opt :repo, "Bitbucket Repo", :short => "r", :type => String
end

bitbucket = BitBucket.new login: "#{opts[:user]}", password: "#{opts[:pass]}"

repository = "false"

bitbucket.repos.list do |repo|
  if repo.slug == "#{opts[:repo]}"
    repository = "true"
  end
end

puts repository

