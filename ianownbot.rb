require 'marky_markov'
require 'pry'
require 'literate_randomizer'

class Ianownbot
  def initialize
    @dict = 'dictionaries/clean_tweets.txt'
  end
  def markov
    unless @markov
      @markov = MarkyMarkov::Dictionary.new('dictionaries/iano_tweet_dictionary')
      @markov.parse_file @dict
      @markov.save_dictionary!
    end
    @markov
  end

  def literate_gen
      @lg ||= LiterateRandomizer.create(source_material_file: @dict)
  end


  def generate_tweet(force_caps = false)

    tweet = ""
    while tweet.length < 20 || tweet.length > 137
      case rand 2
      when 0
        tweet = markov.generate_n_words rand(22)
      when 1
        tweet = literate_gen.sentence
      end
    end

    # wonder if we are moody or angry
    if force_caps || rand(10)%3 == 0
      tweet.upcase!
    elsif rand(40) == 1
      if tweet[-1] == '.'
        tweet = tweet[0..-2]
      end
      tweet += ' :('
    end

    tweet
  end
end
binding.pry
