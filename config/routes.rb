Rails.application.routes.draw do
  resources :accesses
  #get 'sessions/new'

  get 'projects/move_to_document/:id' => 'projects#move_to_document'
  get 'projects/move_to_access/:id' => 'projects#move_to_access'
  get 'documents/move_to_version/:id' => 'documents#move_to_version'
  get 'versions/make_current/:id' => 'versions#make_current'

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
