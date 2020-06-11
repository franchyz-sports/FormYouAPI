Rails.application.routes.draw do
  resources :categories
  resources :companies
  resources :rooms
  resources :attendances

  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :teachers, controllers: { sessions: 'teachers/sessions' }
  devise_for :students, controllers: { sessions: 'students/sessions' }
  resources :formations do
    resources :sessions do
      resources :attendances
    end
  end

  # => ADDITIONNAL FORMATIONS ROUTES
  get '/myformations',            to: 'formations#myformations'
  # => ADDITIONNAL SESSIONS ROUTES
  get '/mysessions',            to: 'sessions#my_sessions'
  get '/allsessions',            to: 'sessions#all_sessions'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
