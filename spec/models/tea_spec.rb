require 'rails_helper'

RSpec.describe Tea do
  describe 'relationships' do
    it {should have_many(:subscriptions)}
    it {should have_many(:customers).through(:subscriptions)}
    it { should validate_presence_of(:tyep)}
    it { should validate_uniqueness_of(:tyep)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:temperature)}
    it { should validate_presence_of(:brew_time)}

  end
end
