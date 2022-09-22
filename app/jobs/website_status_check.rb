require "net/http"
require 'uri'
class WebsiteStatusCheck
  include Sidekiq::Worker



  def perform(website)
    url = URI.parse(website.url)
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = (url.scheme == 'https')
    path = url.path if url.path.present?
    res = req.request_head(path || '/')
    if res.code == "200"
      website.status="Up"
    end
  rescue Errno::ENOENT
    website.status="Down"
  end
end
