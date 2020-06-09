Rails.application.routes.draw do
  resources :formations
  devise_for :students

  # => ADDITIONNAL FORMATIONS ROUTES
  get '/myformations',            to: 'formations#myformations'



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
