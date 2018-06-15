Rails.application.routes.draw do
  

  devise_for :users
  root to: "pages#index"

  resources :posts do
    resources :postcomments
  end

  resources :photos
  resources :categories
  resources :events

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
