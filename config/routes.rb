Rails.application.routes.draw do
 
  root 'home#index'

  post '/compile' => 'home#compile'

end
