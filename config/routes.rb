Rails.application.routes.draw do
  get 'welcome/index'
  get 'hint/index'
  post 'state/create'
  
  root 'welcome#index'
end
