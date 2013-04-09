# Twitter helper
module TwitterHelper
  # Get the latest Tweet text
  def latest_tweet
    add_entities get_tweet
  end

  # Get the time for the latest Tweet (formatted with `ago`)
  def latest_tweet_time
    ago get_tweet.created_at
  end

  # Get the latest Tweet. Cache for 1 hour to avoid the rate limit
  def get_tweet
    Rails.cache.fetch('latest_tweet', :expires_in => 1.hour) do
      Twitter.user_timeline('brconstable').first
    end
  end
  
  # From the given time, get a nicely formatted 'seconds/minutes/days ago'
  # string
  def ago(time)
    now = Time.new
    diff = (now - time)
      
    case
    when (diff < 1.minute)
      format_denomination('second', diff.to_i)
    when (diff < 1.hour)
      format_denomination('minute', (diff / 1.minute).to_i)
    when (diff < 1.day)
      format_denomination('hour', (diff / 1.hour).to_i)
    else
      format_denomination('day', (diff / 1.day).to_i)
    end
  end

  # Format the time as a string with the given unit text
  def format_denomination(unit, time)
    "#{time.to_s} #{unit}#{time > 1 ? 's' : ''} ago"
  end

  # Add links to Tweet entities
  def add_entities(tweet)
    text = tweet.text

    tweet.urls.each do |url|
      text[url.url] = "<a href=\"#{url.url}\" target=\"_blank\">#{url.display_url}</a>"
    end

    tweet.user_mentions.each do |mention|
      text["@#{mention.screen_name}"] = "<a href=\"http://twitter.com/#{mention.screen_name}\" target=\"_blank\">@#{mention.screen_name}</a>"
    end

    tweet.hashtags.each do |hashtag|
      text["\##{hashtag.text}"] = "<a href=\"http://twitter.com/search?q=%23#{hashtag.text}\" target=\"_blank\">\##{hashtag.text}</a>"
    end
    
    text
  end
end