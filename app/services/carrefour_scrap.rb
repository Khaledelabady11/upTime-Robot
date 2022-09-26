class CarrefourScrap
  URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

  def initialize(url = 'https://www.carrefouregypt.com/mafegy/ar/c/grocery-fifa')
    @url = url
  end

  def perform
    @document = fetch_document
    fetch_product_links
  end

  def fetch_product_links
    prefix = 'https://www.carrefouregypt.com'
    links = @document.search '.css-lzsise a'
    links = links.map(&:values).flatten.uniq.compact.reject(&:empty?)
    links = links.map { |item| "#{prefix}#{item}" }
    links.select { |url| url.match? URL_REGEXP }
  end
  def fetch_document
    mechanize_agent = Mechanize.new
    mechanize_agent.user_agent_alias = 'Mac Safari'
    @document = mechanize_agent.get(@url)
    @document.encoding = 'utf-8'
    @document
  end
end
