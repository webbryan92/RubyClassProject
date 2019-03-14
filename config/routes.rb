Rails.application.routes.draw do
  get 'homepage/index'

  root 'homepage#index'
  resources :captions do 
    member do
      get 'increment_vote'
      get 'decrement_vote'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
