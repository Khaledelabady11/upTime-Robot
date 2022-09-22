class WebsiteStatusWorker
    include Sidekiq::Worker
    sidekiq_options queue: :website_status


    def perform()
        puts "WebsiteStatusWorker"
        # puts "The Website Id is: #{website_id}"
        # website = Website.find(website_id)
        # website.update(status: website_status(website.url))
    end
end