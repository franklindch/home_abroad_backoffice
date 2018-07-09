# frozen_string_literal: true

Rails.application.routes.draw do
	scope '/dashboard' do
		resources :families
    get 'inscription_details', to: 'families#inscription_details'
	end
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_scope :user do
  	root to: "devise/sessions#new"
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
