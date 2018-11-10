Rails.application.routes.draw do
  devise_for :users
  root to: "animals#index"
  resources :animals
  get 'inekler', to: 'animals#cow', as: :cows
  get 'tosunlar', to: 'animals#bullock', as: :bullocks
  get 'danalar', to: 'animals#calf', as: :calves
  get 'mevcut_olmayanlar', to: 'animals#no_exist', as: :no_exits
end
