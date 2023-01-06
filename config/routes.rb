Rails.application.routes.draw do
  resources :records
  resources :users
  #basic pages, tests if server is running
  get '/home', to: 'pages#home'
  #user model routes
    #user sing in , logout , edit password
  post 'sign_in', to:'sessions#create'
  post '/sign_in.json', to:'sessions#create'
  ############
  get "/logout", to: 'sessions#destroy'
  get '/password', to: 'passwords#edit', as: :edit_password
  patch '/password', to: 'passwords#update'
  patch '/password.json', to: 'passwords#update'

  #user registration
  post 'sign_up', to:'registrations#create'
  get '/status', to: 'registrations#status'
  # get 'registration/sign_in'

  
  #python script
  get '/py', to: 'scripts#run_py'
  get '/send_sms', to: 'scripts#send_sms'
  get '/verify', to: 'scripts#verify'
  get '/py/:id', to: 'scripts#run_py'
  
  #user model info
  get '/role', to: 'users#role'
  get '/user', to: 'users#current_email'
  get '/current', to: 'pages#current_user'
  get '/q', to: 'pages#recordquerry'
  get '/q.json', to: 'pages#recordquerry'

  #roles controller 
  post '/change_role', to: 'roles#change_role'
  post 'sms', to: 'roles#sms_verification'
  get '/num', to: 'roles#num'
  post '/verify', to: 'roles#verify'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  

end
