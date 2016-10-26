Rails.application.routes.draw do
  match "/application.manifest" => Rails::Offline, :via => [:get, :post]

  resources "inscricao", only: [:create]

  root "eventos#index"

  resources :eventos, only: [:show]

  devise_for :usuarios
  scope :admin, module: 'admin' do
    resources :inscricoes, only: [:index, :update, :destroy] do
      get :csv, on: :collection
      get :lista_de_presencas, on: :collection
    end

    resources :home, only: [:index]
    root 'home#index', as: :usuario_root
  end

end
