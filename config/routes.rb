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
    resources :travel_groups

    resources :travels, only: [:show] do
      resources :transits
    end

    resources :programs
    resources :qualification, only: [:show] do
      resources :child_details
    end

    resources :child_details, only: [:index]

    resources :travels, only: [:index, :destroy, :edit, :update]
    resources :travels, only: [:show] do
      resources :off_set_travels, only: [:new, :create, :edit, :update]
    end


    get 'enrollment_form', to: 'language_stays#enrollment_form'
    get 'language_stay_certificate', to: 'language_stays#certificate', format: 'docx'
    get 'invoice_pdf', to: 'invoices#invoice'
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
  get 'all_clients', to: 'excels#all_clients'
  get 'all_partner_companies', to: 'excels#all_partner_companies'
  get 'all_programs', to: 'excels#all_programs'
  get 'all_attendants', to: 'excels#all_attendants'
  get 'all_child_details', to: 'excels#all_child_details'
  get 'all_travel_groups', to: 'excels#all_travel_groups'

  get 'close_prospect', to: 'qualifications#close_prospect'
  get 'reestablish_prospect', to: 'qualifications#reestablish_prospect'
  get 'cancel_language_stay', to: 'language_stays#cancel_language_stay'
  get 'reestablish_language_stay', to: 'language_stays#reestablish_language_stay'
  get 'reestablish_prospect', to: 'qualifications#reestablish_prospect'
  get 'relaunch', to: 'child_details#relaunch'
  get "families/:id/qualification", to: "qualifications#new", as: :family_qualification
  post "families/:id/qualification", to: "qualifications#create"
  post "qualifications/:id/child_detail", to: "child_details#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
