class BotsController < ApplicationController
  @@limit_tweet = 30

  def index
  end

  def confucius
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["YOUR_CONSUMER_KEY"]
      config.consumer_secret     = ENV["YOUR_CONSUMER_SECRET"]
      config.access_token        = ENV["YOUR_ACCESS_TOKEN"]
      config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
    end
    # nouns= "I You He She It They We Sarah Susan Andy James Donald Nat David Gabriel"
    verbs = "run walk sleep jump sit stand think fight flee dive swim kick stab shoot"
    articles = "a at the to from with towards back"
    adjective = "nice mean stupid skinny fat smart sweet sleepy blonde freckled pink cold hot round bloated"
    object = "fence stairs bottle knife gun motorcycle flower house suit laptop gem soda wizard unicorn butterflies rainbows"
    adverbs = "quickly slowly cunningly thoroughly indiscriminantly magically quietly secretly violently peacefully eerily"

    # r_nouns = nouns.split[Random.rand(nouns.split.length)]
    r_verbs = verbs.split[Random.rand(verbs.split.length)]
    r_articles = articles.split[Random.rand(articles.split.length)]
    r_adjective = adjective.split[Random.rand(adjective.split.length)]
    r_object = object.split[Random.rand(object.split.length)]
    r_adverbs = adverbs.split[Random.rand(adverbs.split.length)]

    @@limit_tweet -= 1
    if @@limit_tweet < 0
      @random = nil
    else
      @random = "You should " + r_adverbs + " " + r_verbs+ " " + r_articles + " " + r_adjective + " " + r_object + "."
    end
    render 'index'
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
    def bot_params
      params.require(:bot).permit(:question)
    end
end
