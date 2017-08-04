Rails.application.routes.draw do

  root "top#index"

  devise_for :users

  resources :topics, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      post :confirm
    end
  end
end
