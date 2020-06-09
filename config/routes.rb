Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :teachers, controllers: { sessions: 'teachers/sessions' }
  devise_for :students, controllers: { sessions: 'students/sessions' }
  resources :formations do 
    resources :sessions
  end

  # => ADDITIONNAL FORMATIONS ROUTES
  get '/myformations',            to: 'formations#myformations'



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
