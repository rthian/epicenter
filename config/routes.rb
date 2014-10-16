Rails.application.routes.draw do
  root 'static_pages#index'
  get 'attendance', to: 'attendance_records#index', as: 'attendance'

  devise_for :users

  resource :bank_account, only: [:new, :create]
  resource :verification, only: [:edit, :update]
  resources :payments, only: [:index]
  resources :upfront_payments, only: [:new, :create]
  resources :recurring_payments, only: [:new, :create]
  resources :attendance_records, only: [:create, :destroy]
  resources :cohorts, only: [] do
    resource :attendance_statistics, only: [:show]
  end
end
