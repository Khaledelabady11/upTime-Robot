class Website < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true
  validates :url, :format => { :with => URI::regexp(%w(http https)), :message => "Valid URL required"}

end
