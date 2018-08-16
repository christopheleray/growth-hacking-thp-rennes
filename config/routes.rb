Rails.application.routes.draw do
  root to: 'statics_pages#index'
  get '/twitter', to: 'statics_pages#twitter', as: 'twitter'
  get '/linkedin', to: 'statics_pages#linkedin', as: 'linkedin'
end
