Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :docs
  authenticated :user do
    root "docs#index", as: "authenticated_root"   #root za usera koji je logovan
  end
  
  root 'welcome#index'                            #root za usera koji nije logovan
  
  
end
