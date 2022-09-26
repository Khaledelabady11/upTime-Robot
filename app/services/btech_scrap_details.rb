class BtechScrapDetails
    URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

    def initialize(url = 'https://btech.com/ar/xiaomi-redmi-10c-dual-sim-128gb-4gb-4g-lte-grey.html')
      @url = url
    end

    def perform
        @document = fetch_document
        fetch_product_title
        fetch_product_price
        fetch_product_images
        # @document.search('.product-item-view a').text.strip
    end

    def fetch_product_title
        byebug
        @document.search('.base').text.strip
    end

    def fetch_product_price
        @document.search('.price-huge-static').text.strip
    end

    def fetch_product_images
        images.map { |image| image['src'] }
    end

    def fetch_product_description
        @document.search('#accordion').text.strip
    end
  
    def fetch_document
        mechanize_agent = Mechanize.new
        mechanize_agent.user_agent_alias = 'Mac Safari'
        @document = mechanize_agent.get(@url)
        @document.encoding = 'utf-8'
        @document
    end
end
  