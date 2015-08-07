Rails.application.routes.draw do
  resources "inscricao", only: [:create]

  root "eventos#realidade_virtual"

  resources "eventos", only: [] do
    get "cleancode", on: :collection
    get "desenvolvimento_mobile", on: :collection
    get "http_ux", on: :collection
    get "realidade_virtual", on: :collection
  end

  devise_for :usuarios
  scope :admin, module: 'admin' do
    resources :inscricoes, only: [:index, :update, :destroy] do
      get :csv, on: :collection
    end
    root 'inscricoes#index', as: :usuarios_root
  end

end