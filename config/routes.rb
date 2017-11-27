Rails.application.routes.draw do
  get 'sessions/new'

  root 		'static_pages#home'
  get     '/busca',     to: 'dynamic_pages#search'
  get 		'/duvidas',		to: 'static_pages#doubt'
  get		  '/sobre',		  to: 'static_pages#about'
  get 		'/signup', 		to: 'professors#new'
  post 		'/signup',  	to: 'professors#create'
  get     '/newproj',   to: 'projects#new'
  post    '/newproj',   to: 'projects#create'
  get   	'/login',   	to: 'sessions#new'
  get     '/tutorials', to: 'static_pages#tutorials'
  post  	'/login',   	to: 'sessions#create'
  delete	'/logout',  	to: 'sessions#destroy'
  resources :professors
  resources :projects,  only: [:create, :destroy, :show, :index]
end
