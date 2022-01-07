Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers
        get "customers/:id/subscriptions", to: "customers/subscriptions#index"
        post "customers/:id/subscriptions", to: "customers/subscriptions#create"
        patch "customers/:id/subscriptions/:subscription_id", to: "customers/subscriptions#update"
    end
  end
end
