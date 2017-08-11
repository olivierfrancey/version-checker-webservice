Rails.application.routes.draw do
  resources :qr_code_positions
  resources :accesses
  #get 'sessions/new'

  get 'projects/move_to_document/:id', to: 'projects#move_to_document'
  get 'projects/move_to_access/:id', to: 'projects#move_to_access'
  get 'projects/move_to_detail/:id', to: 'projects#move_to_detail'
  get 'documents/move_to_version/:id', to: 'documents#move_to_version'
  get 'versions/make_current/:id', to: 'versions#make_current'
  post 'versions/download/', to: 'versions#download'
  get 'users/sunburst', to: 'users#sunburst'
  get 'users/stats/:id', to: 'users#stats'

  scope "(:locale)", locale: /en|fr|de/ do
    root 'static_pages#home'
    resource :session, only: %i[new create destroy]
    resources :users
    resources :versions
    resources :documents
    resources :projects  
    resources :groups  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
