class Ianownbot
  def markov
    unless @markov
      @markov = MarkyMarkov::Dictionary.new('dictionaries/iano_tweet_dictionary')
      @markov.parse_file "dictionaries/clean_tweets.txt"
      @markov.save_dictionary!
    end
    @markov
  end

  def generate_tweet(force_caps = false)
    tweet = ""
    while tweet.length < 20 || tweet.length > 137
      tweet = markov.generate_n_words rand(22)
    end

    # wonder if we are moody or angry
    if force_caps || rand(10)%3 == 0
      tweet.upcase!
    elsif rand(40) == 1
      tweet += ' :('
    end

    tweet
  end
end
