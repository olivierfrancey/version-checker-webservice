Rails.application.routes.draw do
  get 'sessions/new'

  get 'projects/move_to_document/:id' => 'projects#move_to_document'
  get 'documents/move_to_version/:id' => 'documents#move_to_version'

  scope "(:locale)", locale: /en|fr|de/ do
    root 'static_pages#home'
    resource :session, only: %i[new create destroy]
    resources :users
    resources :versions
    resources :documents
    resources :projects    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
