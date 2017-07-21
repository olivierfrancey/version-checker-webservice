Rails.application.routes.draw do
  get 'sessions/new'

  resource :session, only: %i[new create destroy]
  resources :user_projects

  scope "(:locale)", locale: /en|fr|de/ do
    root 'static_pages#home'
    resources :users
    resources :versions
    resources :documents
    resources :projects    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
