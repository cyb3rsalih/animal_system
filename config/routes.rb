Rails.application.routes.draw do
  get 'animal/show'
  get 'animal/new'
  get 'animal/index'
  root to: "animal#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
