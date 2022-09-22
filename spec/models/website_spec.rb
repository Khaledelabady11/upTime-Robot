RSpec.describe Website, type: :model do
  context '#validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
  end

  context 'when url is valid' do
    let(:website) { build(:website) }
    it { expect(website.valid?).to be_truthy }
  end

  context 'when url is invalid' do
    let(:website) { build(:website, url: 'som random email') }
    it {
      expect(website.valid?).to be_falsey
      expect(website.errors.messages.keys).to eq([:url])
    }
  end
end
