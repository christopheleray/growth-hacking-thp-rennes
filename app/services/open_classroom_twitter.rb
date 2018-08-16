class OpenClassroomTwitter
  attr_accessor :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key         = ENV['TWITTER_API_KEY']
      config.consumer_secret      = ENV['TWITTER_API_SECRET']
      config.access_token         = ENV['TWITTER_TOKEN']
      config.access_token_secret  = ENV['TWITTER_TOKEN_SECRET']
    end
  end

  def follow_user(user)
    p '-' * 20 + 'following' + '-' * 20
    @client.follow(user)
    p '-' * 20 + 'followed' + '-' * 20
  end

  def get_and_like_last_tweet(user)
    p '-' * 20 + 'getting the last tweet from this user' + '-' * 20
    last_tweet = @client.user_timeline(user).last
    p '-' * 20 + 'Liking the last tweet from the user' + '-' * 20
    @client.favorite(last_tweet.id)
    p '-' * 20 + 'last tweet from user is liked' + '-' * 20
  end

  def send_dm(user)
    p '-' * 20 + 'sending dm to the user' + '-' * 20
    @client.create_direct_message(user.id, "Salut, est-ce que ça te dis d'apprendre à coder ? si oui, rends toi à l'adresse suivante : https://thp-rennes-growth-hacking.herokuapp.com/twitter pour voir ce qu'on a réussis à faire en 1 mois et demi avec la formation The Hacking Project")
    p '-' * 20 + 'dm sent' + '-' * 20
  end

  def get_oc_followers
    p '-' * 20 + "let's start this shit" + '-' * 20
    @client.followers("OCFrance").each do |follower|
      follow_user(follower.id)
      get_and_like_last_tweet(follower.id)
      send_dm(follower.id)
      sleep 3600
    end
    p '-' * 20 + 'Done' + '-' * 20
  end
end
