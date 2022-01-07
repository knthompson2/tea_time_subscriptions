require 'rails_helper'

RSpec.describe 'all subscriptions for a customer' do
  describe 'happy path' do
    it 'returns all subscriptions for a customer, active or canceled' do
      customer = Customer.create!(first_name: "Charlie", last_name: "Teator", email: "charlielovestea@gmail.com", address: "123 Sesame Street, New York, New York, 12345")
      tea = Tea.create!(tyep: "Lavendar", description: "Lavendary tea with a hint of more lavendar", temperature: "Hot", brew_time: 12)
      Subscription.create!(title: "#{tea.tyep} - quarterly", customer_id: customer.id, tea_id: tea.id, price: 28.00, status: "active", frequency: "quarterly")
      Subscription.create!(title: "#{tea.tyep} - monthly", customer_id: customer.id, tea_id: tea.id, price: 90.00, status: "canceled", frequency: "monthly")

      get "/api/v1/customers/#{customer.id}/subscriptions"
      expect(response).to be_successful
      subscriptions  = JSON.parse(response.body, symbolize_names: true)
      expect(subscriptions[:data].count).to eq(2)
    end
  end

  describe 'sad path' do
    it 'returns an error if customer doesnt exist' do
      customer = Customer.create!(first_name: "Charlie", last_name: "Teator", email: "charlielovestea@gmail.com", address: "123 Sesame Street, New York, New York, 12345")
      tea = Tea.create!(tyep: "Lavendar", description: "Lavendary tea with a hint of more lavendar", temperature: "Hot", brew_time: 12)
      Subscription.create!(title: "#{tea.tyep} - quarterly", customer_id: customer.id, tea_id: tea.id, price: 28.00, status: "active", frequency: "quarterly")
      Subscription.create!(title: "#{tea.tyep} - monthly", customer_id: customer.id, tea_id: tea.id, price: 90.00, status: "canceled", frequency: "monthly")

      get "/api/v1/customers/4/subscriptions"
      expect(response).to_not be_successful
    end
  end
end
