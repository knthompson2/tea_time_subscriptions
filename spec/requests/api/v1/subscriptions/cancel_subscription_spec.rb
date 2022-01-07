require 'rails_helper'

RSpec.describe 'cancel_subscription' do
  describe 'happy path' do
    it 'can update subscription status to canceled' do
      customer = Customer.create!(first_name: "Charlie", last_name: "Teator", email: "charlielovestea@gmail.com", address: "123 Sesame Street, New York, New York, 12345")
      tea = Tea.create!(tyep: "Lavendar", description: "Lavendary tea with a hint of more lavendar", temperature: "Hot", brew_time: 12)
      subscription = Subscription.create!(title: "#{tea.tyep} - quarterly", customer_id: customer.id, tea_id: tea.id, price: 7.99, status: "active", frequency: "quarterly")

      expect(subscription.status).to eq("active")

      post "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}", params: {subscription_id: subscription.id, status: "canceled"}

      subscription.reload
      expect(response).to be_successful
      expect(subscription.status).to eq("canceled")
    end
  end

  describe 'sad path' do
    it 'returns an error if the subscription doesnt exist' do
      customer = Customer.create!(first_name: "Charlie", last_name: "Teator", email: "charlielovestea@gmail.com", address: "123 Sesame Street, New York, New York, 12345")
      tea = Tea.create!(tyep: "Lavendar", description: "Lavendary tea with a hint of more lavendar", temperature: "Hot", brew_time: 12)
      Subscription.create!(title: "#{tea.tyep} - quarterly", customer_id: customer.id, tea_id: tea.id, price: 7.99, status: "active", frequency: "quarterly")

      post "/api/v1/customers/#{customer.id}/subscriptions/2", params: {subscription_id: 2, status: "canceled"}
      
      expect(response).to_not be_successful
    end
  end
end
