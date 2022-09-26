class BtechScrap
    URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

    def initialize(url = 'https://btech.com/ar/moblies/mobile-phones-smartphones/smartphones.html')
      @url = url
    end

    def perform
        @document = fetch_document
        fetch_product_links
        # @document.search('.product-item-view a').text.strip
    end

    def fetch_product_links
        links = @document.search '.product-item-view a'
        links = links.map(&:values).flatten.uniq
        # links.map { |item| 'https://btech.com' + item }
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
  