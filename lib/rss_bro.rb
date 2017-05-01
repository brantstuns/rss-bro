require 'rss'
require 'open-uri'
require 'date'

class RSSBro
  def initialize (rss_url)
    @rss_url = rss_url
  end

  rss_url = ARGV[0]
  open(rss_url) do |rss|
    feed = RSS::Parser.parse(rss)
    feed.items.each do |post|
      post_date = post.date.to_date
      todays_date = Date.today.prev_day
      puts "post date: #{post_date}, todays date: #{todays_date}"
      if post_date == todays_date
        puts "yo #{post.title}"
      end
    end
  end
end