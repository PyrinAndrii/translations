Rails.application.routes.draw do
    resources :posts do
        resources :comments
    end

    resources :tags, only: [:show]

  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
    root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/services'
  get 'static_pages/contacts'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
