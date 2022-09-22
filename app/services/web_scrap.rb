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

    # return scraped content list here
    # add your logic
  end
end
