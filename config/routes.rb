Rails.application.routes.draw do
  resources :signups, only: [:new, :create] do
    collection do
      get :return
    end
  end

  root to: "signups#new"
end
