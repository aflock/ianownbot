require 'dotenv/tasks'

task environment: :dotenv do
  require File.expand_path(File.join(*%w[ initializer ]), File.dirname(__FILE__))
end

task tweet: :environment do
  if Time.now.hour % 3 == 0
    sleep(rand(1800))
    tweet = Ianownbot.new.generate_tweet
    Twitter.update(tweet)
  end
end

task tweet_now: :environment do
  tweet = Ianownbot.new.generate_tweet
  Twitter.update(tweet)
end
