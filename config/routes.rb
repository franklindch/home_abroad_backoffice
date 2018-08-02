# frozen_string_literal: true

Rails.application.routes.draw do
	scope '/dashboard' do
    resources :clients, only: [:new, :index, :create, :update]
    resources :families do
      resources :clients, only: [:edit, :create, :update, :destroy, :show, :new]
    end
    # resources :employees, only: [:index]
    resources :partner_companies, only: [:new, :index, :create] do 
      resources :employees, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :clients, only: [:show] do 
      resources :language_stays, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :language_stays, only: [:show] do 
      resources :invoices, only: [:new, :create, :edit, :update, :destroy]
    end
    resources :travels
    resources :attendants
    resources :programs

    # post '/dashboard/clients', to: 'clients#create'
    get 'static', to: 'excels#static'
    get 'inscription_details', to: 'families#inscription_details'
  end
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get 'all_families', to: 'excels#all_families'
  get "families/:id/qualification", to: "qualifications#new", as: :family_qualification
  post "families/:id/qualification", to: "qualifications#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
