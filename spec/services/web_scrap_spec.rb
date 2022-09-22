RSpec.describe WebScrap, type: :service do
  context '#validations' do
    let(:service_instance) { WebScrap.new }

    it {
      expect(service_instance.perform).to eq(nil)
    }
  end
end
