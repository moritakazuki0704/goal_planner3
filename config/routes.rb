Rails.application.routes.draw do
  devise_for :users,skip:[:passwords]
  root to: 'homes#top'
  get 'welcome' => 'homes#welcome', as: 'welcome'

  resource :user,only: [:new,:create,:destroy] do
    collection do
      get 'confirm'
      get 'dash_board'
      get 'withdrawal'
    end
  end
  resource :ideal,only: [:show,:create] do
    collection do
      get 'keyword_new'
      get 'personality_new'
      get 'appearance_new'
      get 'lifestyle_new'
      get 'time_new'
      get 'working_new'
      get 'residence_new'
      get 'relationship_new'
      get 'partner_new'
      get 'role_model_new'
      get 'confirm'
    end
  end
  resources :commits,except: [:edit,:destroy] do
    collection do
      get 'confirm'
    end
  end
  resources :missions,except: [:edit,:update,:destroy] do
    collection do
      get 'detail_new'
      get 'confirm'
    end
  end
  resources :motivations,except: [:edit,:update] do
    collection do
      get 'list'
    end
  end
  resources :scrap_books,except: [:new,:edit,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
