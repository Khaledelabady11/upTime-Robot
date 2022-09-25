# https://www.carrefouregypt.com/mafegy/ar/c/grocery-fifa
# use mechanize gem, depends on html selectors
# creat a branch of your name "name-scrap"
# write spec test for this service
# 'https://www.amazon.eg/%D8%A3%D8%AC%D9%87%D8%B2%D8%A9-%D8%A7%D9%84%D9%83%D9%85%D8%A8%D9%8A%D9%88%D8%AA%D8%B1-%D9%88%D9%85%D9%83%D9%88%D9%86%D8%A7%D8%AA%D9%87%D8%A7-%D9%88%D9%85%D9%84%D8%AD%D9%82%D8%A7%D8%AA%D9%87%D8%A7/b?node=21832872031'

# https://www.amazon.eg/dp/B07J9N9XNP/ref=s9_acsd_al_bw_c2_x_0_i?pf_rd_m=A1ZVRGNO5AYLOV&pf_rd_s=merchandised-search-5&pf_rd_r=RKY100M8R17J6B8NHNQF&pf_rd_t=101&pf_rd_p=10457d17-1234-47dc-b390-3d9c291a1770&pf_rd_i=21832872031&th=1

class WebScrap
  URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

  def initialize(url = 'https://www.amazon.eg/s?bbn=21832883031&rh=n%3A21832883031%2Cp_89%3AApple&pf_rd_i=21832883031&pf_rd_m=A1ZVRGNO5AYLOV&pf_rd_p=3791cc79-77bb-4e44-a238-b42dd45cafcd&pf_rd_r=NHASNM3YRNMD34G0YVN7&pf_rd_s=merchandised-search-14&pf_rd_t=101&ref=s9_acss_bw_cg_ATF1208_3a1_w')
    @url = url
  end

  def perform
    @document = fetch_document
    byebug
    @document.search('#productTitle').text.strip
  end

  def fetch_product_links
    links = @document.search '.a-link-normal .s-no-outline'
    links = links.map(&:values).flatten.uniq
    links.map { |item| 'https://www.amazon.eg' + item }
    links.select { |url| url.match? URL_REGEXP }
  end

  def fetch_document
    mechanize_agent = Mechanize.new
    # mechanize_agent.redirection_limit = 4
    mechanize_agent.user_agent_alias = 'Mac Safari'

    @document = mechanize_agent.get(@url)
    @document.encoding = 'utf-8'
    @document
  end
end
