Rails.application.routes.draw do
  root to: 'statics_pages#index'
  get '/twitter', to: 'statics_pages#twitter', as: 'twitter'
  get '/facebook', to: 'statics_pages#facebook', as: 'facebook'
end
