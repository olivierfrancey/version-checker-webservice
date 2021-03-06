Rails.application.routes.draw do

  get 'users/stats/:id',                to: 'users#stats'

  get 'projects/move_to_document/:id',  to: 'projects#move_to_document'
  get 'projects/move_to_access/:id',    to: 'projects#move_to_access'
  get 'projects/move_to_detail/:id',    to: 'projects#move_to_detail'
  get 'projects/all_download/:id',      to: 'projects#all_download'

  get 'documents/move_to_version/:id',  to: 'documents#move_to_version'

  post 'versions/download_pdf/',        to: 'versions#download_pdf'
  post 'versions/download_dxf/',        to: 'versions#download_dxf'
  get 'versions/make_current/:id',      to: 'versions#make_current'
  get 'checker/:encrypted_id',          to: 'versions#checker'
  
  get 'admin/projects',                 to: 'admin#projects'
  get 'admin/users',                    to: 'admin#users'
  get 'admin/new_user',                 to: 'admin#new_user'
  get 'admin/edit_user/:id',            to: 'admin#edit_user'
  get 'admin/logs',                     to: 'admin#logs'

  scope "(:locale)", locale: /en|fr|de/ do
    root 'static_pages#home'
    resource :session, only: %i[new create destroy]
    resources :users
    resources :versions
    resources :documents
    resources :projects  
    resources :groups
    resources :qr_code_positions
    resources :accesses
    resources :admin, only: %i[index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
