# frozen_string_literal: true

Rails.application.routes.draw do
	scope '/dashboard' do
    resources :clients, only: [:new, :index, :create, :update, :edit, :destroy]
    resources :families do
      resources :clients, only: [:edit, :create, :update, :destroy, :show, :new]
    end
    # resources :employees, only: [:index]
    resources :partner_companies, only: [:new, :index, :create, :edit, :destroy] do 
      resources :employees, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :clients, only: [:show] do 
      resources :language_stays, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :language_stays, only: [:show] do 
      resources :invoices, only: [:new, :create, :edit, :update, :destroy]
      resources :travels, only: [:new, :create, :edit, :update, :destroy]
    end
    resources :attendants
    resources :travels, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :programs

    get 'static', to: 'excels#static'
    get 'enrollment_form', to: 'language_stays#enrollment_form'
    get 'invoice', to: 'invoices#invoice'
    get 'paid_invoice', to: 'invoices#paid_invoice'
    get 'airport_convocation', to: 'travels#airport_convocation'
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
