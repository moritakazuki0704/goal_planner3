Rails.application.routes.draw do
  devise_for :users,skip:[:passwords]
  root to: 'homes#top'
  get 'welcome' => 'homes#welcome', as: 'welcome'

  get 'dash_board' => 'users#dash_board', as: 'dash_board'
  get 'withdrawal' => 'users#withdrawal', as: 'withdrawal'
  delete 'users' => 'users#destroy',as: 'user_destroy'

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
      get 'comfirm'
    end
  end

  resource :mission,only: [:new,:create]
  resource :motivation,except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
