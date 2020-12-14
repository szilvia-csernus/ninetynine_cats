Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, only: [:index, :new, :create, :show, :update, :edit, :destroy]
  resources :cat_rental_requests, only: [:index, :show, :new, :create, :destroy]

  resources :cats do
    resources :cat_rental_requests, only: [:index]
  end

  resources :cat_rental_requests do
    member do
      get :approve
    end
    member do
      get :deny
    end
  end

end


