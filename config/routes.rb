Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :test, only: %i[index]
      resources :scores, only: %i[index show create update ]
      resources :users, only: %i[index show]

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        sessions: 'api/v1/auth/sessions'
      }

      devise_scope :api_v1_user do
        post "auth/guest_sign_in", to: "auth/sessions#guest_sign_in"
      end

    end
  end
end