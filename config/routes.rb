Rails.application.routes.draw do
  get 'scion/index'
  get 'scion/create'
  devise_for :users
  root to: "animals#index"
  resources :animals
  get 'inekler', to: 'animals#cow', as: :cows
  get 'tosunlar', to: 'animals#bullock', as: :bullocks
  get 'danalar', to: 'animals#calf', as: :calves
  get 'mevcut_olmayanlar', to: 'animals#no_exist', as: :no_exits

  delete '/animal/scions/:id/:scion_id', to: 'animals#destroy_scion', as: :animal_scions

  get 'asilar', to: 'scions#index', as: :scion
  delete '/asilar/:id', to: 'scions#destroy', as: :asi_sil
  match 'asilar', to: 'scions#create', via: 'post'
  match 'hayvan_ara', to: 'animals#search', via: "get"
  match 'hayvan_ara', to: 'animals#search', via: "post"
end
