Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  resources :members
  resources :events do
    collection do
      get 'search'
    end
  end
    
  root 'welcome#index'
end
