class Api::V1::Customers::SubscriptionsController < ApplicationController
  def create
    if Customer.exists?(params[:customer_id]) && Tea.exists?(params[:tea_id])
      subscription = Subscription.create(subscription_params)
      if subscription.save
        render json: SubscriptionSerializer.new(subscription), status: :ok
      else
        render json: {error: subscription.errors.full_messages.to_sentence}, status: 400
      end
    else
      render json: {error: "not-found"}, status: 404
    end
  end

  def index
    if Customer.exists?(params[:id])
      customer = Customer.find(params[:id])
      subscriptions = customer.subscriptions
      render json: SubscriptionSerializer.new(subscriptions), status: :ok
    else
      render json: {error: "not-found"}, status: 404
    end
  end

  def update
    subscription = Subscription.find_by(id: params[:subscription_id])
    if subscription && subscription.update(subscription_params)
      render json: SubscriptionSerializer.new(subscription), status: :ok
    else
      render json: {error: "not-found"}, status: 404
    end
  end

  private

  def subscription_params
    params.permit(:price, :status, :frequency, :customer_id, :tea_id)
  end
end
