Rails.application.routes.draw do
  devise_for :users,skip:[:passwords]
  root to: 'homes#top'
  get 'welcome' => 'homes#welcome', as: 'welcome'

  resource :user,only: [:new,:create,:destroy] do
    collection do
      get 'confirm'
      # get 'dash_board'
      get 'withdrawal'
    end
  end
  resource :ideal,only: [:show,:create,:destroy] do
    collection do
      get 'step1_keyword'
      get 'step2_personality'
      get 'step3_appearance'
      get 'step4_lifestyle'
      get 'step5_time'
      get 'step6_working'
      get 'step7_residence'
      get 'step8_relationship'
      get 'step9_partner'
      get 'step10_role_model'
      get 'confirm'
    end
  end
  resources :commits,except: [:edit,:destroy] do
    collection do
      get 'confirm'
    end
    resources :missions,only: [:create,:destroy] do
      member do
        post 'upload'
      end
      collection do
        post 'bulk_upload'
        delete 'bulk_destroy'
      end
    end
  end
  resources :schedules do
    resources :plans,only: [:create,:destroy] do
      member do
        patch 'upload'
      end
      collection do
        patch 'all_update'
        patch 'bulk_upload'
        delele 'bulk_destroy'
      end
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
