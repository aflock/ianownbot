require 'dotenv/tasks'

task environment: :dotenv do
  require File.expand_path(File.join(*%w[ initializer ]), File.dirname(__FILE__))
end

task tweet: :environment do
  tweet = Ianownbot.new.generate_tweet
  Twitter.update(tweet)
end

