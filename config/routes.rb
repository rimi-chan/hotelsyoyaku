Rails.application.routes.draw do
    
 get 'users/account'
 get 'users/profile'
 post 'reservations/confirm' 
 get  'hotels/search' => 'hotels#search'


resources :users, only: [:account, :profile, :update]

resources :home, only: [:index]
  
resources :hotels, only: [:index, :new, :create, :show]

 
resources :reservations, only: [:index, :new, :create, :show]



 
 devise_for :users
 
  root to: "home#index"

  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  
 
  

end
