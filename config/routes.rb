Rails.application.routes.draw do
  resources :cribs
  resources :tenants
  resources :owners do
    resources :cribs
  end
end
