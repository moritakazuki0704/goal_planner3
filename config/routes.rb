Rails.application.routes.draw do
  get 'motivations/new'
  get 'motivations/edit'
  get 'motivations/index'
  devise_for :users,skip:[:passwords]
  root to: 'homes#top'
  get 'welcome' => 'homes#welcome', as: 'welcome'
  get 'dash_board' => 'users#dash_board', as: 'dash_board'
  get 'withdrawal' => 'users#withdrawal', as: 'withdrawal'
  delete 'users' => 'users#destroy',as: 'user_destroy'
  resource :keywords,only: [:new,:create] do
    collection do
      get 'introduction'
    end
  end
  resources :ideals,except: [:show,:destroy]
  resources :missions,only: [:new,:create]
  resources :motivations,except: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
