# frozen_string_literal: true

Rails.application.routes.draw do
	scope '/dashboard' do
    resources :clients, only: [:new, :index, :create, :update, :edit, :destroy]
    resources :families do
      resources :clients, only: [:edit, :create, :update, :destroy, :show, :new]
    end
    resources :partner_companies, only: [:new, :index, :create, :edit, :destroy, :update] do
      resources :employees, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :clients, only: :show do
      resources :language_stays, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :language_stays, only: [:show, :index] do
      resources :invoices, only: [:new, :create, :edit, :update, :destroy]
      resources :travels, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :invoices, only: [:show] do
      resources :payments, only: [:edit, :destroy, :update]
    end
    resources :attendants

    resources :travels, only: [:show] do
      resources :transits
    end

    resources :programs
    resources :qualification, only: [:show] do
      resources :child_details
    end

    resources :child_details, only: [:index]


    resources :travels, only: [:index, :destroy, :edit, :update]

    resources :travel_groups
    resources :travel_groups, only: [:show] do
      resources :travel_details, only: [:new, :create, :edit, :update]
    end
    resources :travels, only: [:show] do
      resources :off_set_travels, only: [:new, :create, :edit, :update]
      resources :travel_details, only: [:new, :create, :edit, :update]
    end


    resources :travel_details, only: [:show] do
      resources :correspondences, only: [:new, :create, :edit, :update]
    end

    get 'enrollment_form', to: 'language_stays#enrollment_form'
    get 'language_stay_certificate', to: 'language_stays#certificate', format: 'docx'
    get 'invoice_pdf', to: 'invoices#invoice'
    get 'paid_invoice', to: 'invoices#paid_invoice'
    get 'airport_convocation', to: 'travel_groups#airport_convocation'
    get 'transit_pdf', to: 'transits#transit_pdf'
  end

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_scope :user do
    root to: "devise/sessions#new"
  end


  resources :excels, only: :index

  get 'download', to: 'clients#download'
  get 'download_600', to: 'clients#download_600'
  get 'download_rest', to: 'clients#download_rest'
  get 'download_prospects', to: 'child_details#download_prospects'
  get 'download_partenaires', to: 'partner_companies#download_partenaires'
  get 'download_acc', to: 'attendants#download_acc'

  get 'language_stay_confirmation_sent', to: 'language_stays#send_confirmation'
  get 'language_stay_cancel_confirmation', to: 'language_stays#cancel_confirmation'

  get 'close_prospect', to: 'qualifications#close_prospect'
  get 'reestablish_prospect', to: 'qualifications#reestablish_prospect'
  get 'cancel_language_stay', to: 'language_stays#cancel_language_stay'
  get 'reestablish_language_stay', to: 'language_stays#reestablish_language_stay'
  get 'reestablish_prospect', to: 'qualifications#reestablish_prospect'

  get 'relaunch', to: 'child_details#relaunch'

  get "families/:id/qualification", to: "qualifications#new", as: :family_qualification
  post "families/:id/qualification", to: "qualifications#create"
  post "qualifications/:id/child_detail", to: "child_details#create"
  get 'incomplete_files', to: "language_stays#incomplete_files"
  get 'still_need_payment', to: "invoices#still_need_payment"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# resources :unpaid_invoices, only: :index
# resources :unpaid_invoices, only: :index
# scope :send_confirmation do
# scope :send_confirmation do
# scope :send_confirmation do
#
# end
#
# .where(picture: true).or(...)
#
