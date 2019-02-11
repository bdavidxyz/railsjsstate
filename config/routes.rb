Rails.application.routes.draw do
  get 'welcome/index'
  get 'hint/index'
  post 'hint/before_unload'
  
  root 'welcome#index'
end
