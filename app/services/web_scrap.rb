# https://www.carrefouregypt.com/mafegy/ar/c/grocery-fifa
# use mechanize gem, depends on html selectors
# creat a branch of your name "name-scrap"
# write spec test for this service
class WebScrap
  def initialize(url = 'https://www.carrefouregypt.com/mafegy/ar/c/grocery-fifa')
    @url = url
  end

  def perform
    puts @url
    mechanize_agent = Mechanize.new
    # mechanize_agent.redirection_limit = 4
    mechanize_agent.user_agent_alias = 'Mac Safari'
    page = mechanize_agent.get(@url)
    page.search('.css-1nhiovu a')
  end
end
