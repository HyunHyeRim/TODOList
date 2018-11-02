Rails.application.routes.draw do

	resources :todo

	get '/index' => 'todo#index'
	get '/add' => 'todo#add'
	get '/deadline' => 'todo#deadline'
	post '/todo/:id' => 'todo#complete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
