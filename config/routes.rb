# frozen_string_literal: true

Rails.application.routes.draw do
	scope '/dashboard' do
    resources :clients, only: [:new, :index, :create, :update, :edit, :destroy]
    resources :families do
      resources :clients, only: [:edit, :create, :update, :destroy, :show, :new]
    end
    # resources :employees, only: [:index]
    resources :partner_companies, only: [:new, :index, :create, :edit, :destroy, :update] do
      resources :employees, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :clients, only: [:show] do
      resources :language_stays, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :language_stays, only: [:show] do
      resources :invoices, only: [:new, :create, :edit, :update, :destroy]
      resources :travels, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :invoices, only: [:show] do
      resources :payments, only: [:edit, :destroy, :update]
    end
    resources :attendants
    resources :travel_groups, only: [:index, :new, :create, :edit, :update, :destroy]

    resources :travels, only: [:show] do
      resources :transits
    end

    resources :programs
    resources :qualification, only: [:show] do
      resources :child_details
    end

    resources :travels, only: [:index, :destroy, :edit, :update]
    resources :travels, only: [:show] do
      resources :off_set_travels, only: [:new, :create, :edit, :update]
    end

    get 'static', to: 'excels#static'
    get 'enrollment_form', to: 'language_stays#enrollment_form'
    get 'language_stay_certificate', to: 'language_stays#certificate', format: 'docx'
    get 'invoice', to: 'invoices#invoice'
    get 'paid_invoice', to: 'invoices#paid_invoice'
    get 'airport_convocation', to: 'travel_groups#airport_convocation'
  end

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get 'all_families', to: 'excels#all_families'
  get 'close_prospect', to: 'qualifications#close_prospect'
  get 'reestablish_prospect', to: 'qualifications#reestablish_prospect'
  get 'cancel_language_stay', to: 'language_stays#cancel_language_stay'
  get 'reestablish_language_stay', to: 'language_stays#reestablish_language_stay'
  get 'reestablish_prospect', to: 'qualifications#reestablish_prospect'
  get "families/:id/qualification", to: "qualifications#new", as: :family_qualification
  post "families/:id/qualification", to: "qualifications#create"
  post "qualifications/:id/child_detail", to: "child_details#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
