require 'rails_helper'

RSpec.describe 'create subscription' do
  describe 'happy path' do
    it 'can create a subscription' do
      customer = Customer.create!(first_name: "Charlie", last_name: "Teator", email: "charlielovestea@gmail.com", address: "123 Sesame Street, New York, New York, 12345")
      tea = Tea.create!(tyep: "Lavendar", description: "Lavendary tea with a hint of more lavendar", temperature: "Hot", brew_time: 12)
      post "/api/v1/customers/#{customer.id}/subscriptions", params: { customer_id: customer.id, tea_id: tea.id, price: 7.99, status: "active", frequency: "quarterly"}
      new_subscription = Subscription.last
      expect(response).to be_successful
      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(new_subscription.id).to be_an(Integer)
      expect(response_body[:data]).to have_key(:attributes)
      expect(response_body[:data][:attributes]).to have_key(:customer_id)
      expect(response_body[:data][:attributes]).to have_key(:tea_id)
      expect(response_body[:data][:attributes]).to have_key(:price)
      expect(response_body[:data][:attributes]).to have_key(:frequency)
      expect(response_body[:data][:attributes]).to have_key(:title)
      expect(response_body[:data][:attributes]).to have_key(:status)
    end
  end

  describe 'sad path' do
    it 'returns an error if the customer doesnt exist' do
      tea = Tea.create!(tyep: "Lavendar", description: "Lavendary tea with a hint of more lavendar", temperature: "Hot", brew_time: 12)
      post "/api/v1/customers/4/subscriptions", params: {title: "#{tea.tyep} - quarterly", customer_id: 4, tea_id: tea.id, price: 7.99, status: "active", frequency: "quarterly"}

      expect(response).to_not be_successful

    end

    it 'returns an error if the tea doesnt exist' do
      customer = Customer.create!(first_name: "Charlie", last_name: "Teator", email: "charlielovestea@gmail.com", address: "123 Sesame Street, New York, New York, 12345")
      post "/api/v1/customers/#{customer.id}/subscriptions", params: {title: "Lavendar- quarterly", customer_id: customer.id, tea_id: 2, price: 7.99, status: "active", frequency: "quarterly"}

      expect(response).to_not be_successful

    end

    it 'returns an error if the request is incomplete' do
      customer = Customer.create!(first_name: "Charlie", last_name: "Teator", email: "charlielovestea@gmail.com", address: "123 Sesame Street, New York, New York, 12345")
      tea = Tea.create!(tyep: "Lavendar", description: "Lavendary tea with a hint of more lavendar", temperature: "Hot", brew_time: 12)
      post "/api/v1/customers/#{customer.id}/subscriptions", params: {title: "#{tea.tyep} - quarterly", customer_id: customer.id, tea_id: tea.id, price: 7.99, status: "active"}

      expect(response).to_not be_successful

    end
  end
end
