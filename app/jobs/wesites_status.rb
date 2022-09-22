class WebsitesStatus
  include Sidekiq::Worker

  # def perform
  #   @websites.each do |website|
  #     WebsiteStatusCheck.perform_async(website)
  #   end
  # end
end
