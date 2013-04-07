require 'rubygems'
require 'bundler/setup'

require 'dotenv'
Dotenv.load

require 'marky_markov'
require 'twitter'

require './ianownbot'

Twitter.configure do |config|
  config.consumer_key = ENV['consumer_key']
  config.consumer_secret = ENV['consumer_secret']
  config.oauth_token = ENV['oauth_token']
  config.oauth_token_secret = ENV['oauth_token_secret']
end

