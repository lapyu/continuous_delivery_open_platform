require_relative "boot"
require 'bitbucket_rest_api'

opts = Trollop::options do
  opt :user, "Bitbucket Username", :short => "u", :type => String
  opt :pass, "Bitbucket Password", :short => "p", :type => String
  opt :repo, "Bitbucket Repo", :short => "r", :type => String
  opt :owner, "Bitbucket Project Owner", :short => "o", :type => String
  opt :publicKey, "path to public key", :short => "k", :type => String
end

bitbucket = BitBucket.new login: "#{opts[:user]}", password: "#{opts[:pass]}"

file = File.open("#{opts[:publicKey]}", "r")
rsa = file.read

bitbucket.repos.keys.create "#{opts[:owner]}", "#{opts[:repo]}",
	"label" => "CDPlatform",
    "key" => "#{rsa}"
