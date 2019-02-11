Rails.application.routes.draw do
  get 'welcome/index'
  get 'hint/index'
  put 'state/update'
  
  root 'welcome#index'
end
