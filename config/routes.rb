Rails.application.routes.draw do
  get 'welcome/index'
  get 'hint/index'
  
  root 'welcome#index'
end
