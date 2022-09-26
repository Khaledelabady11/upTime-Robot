class GoogleScrape
    def initialize(url = 'http://www.google.com')
        @url = url
        @mechanize = Mechanize.new
        @page = @mechanize.get(@url)
    end

    def fetch_title
        @page.search('title').text.strip
    end


    def fetch_links
        @page.links.each do |link|
            puts link.text
        end
        @page.encoding = 'utf-8'
    end

    def fetch_imgs
        @page.images.each do |img|
            puts img.src
        end
        @page.encoding = 'utf-8'
        @page
    end

    def links_click

        @page = @mechanize.page.links.find { |l| l.text == 'Drive' }.click

    end

    def access_forms
        # pp @page
        google_form = @page.form('f')
        google_form.q = 'ruby mechanize'
        @page=google_form.submit
        pp @page
    end

end
