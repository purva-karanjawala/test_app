Rails.application.routes.draw do
  
  # resources :questions 
  devise_for :users

  resources :users do
  	resources :topics
  end
  resources :topics do 
    resources :questions
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "welcomes#index"
  root to: "users#index"
end
