Rails.application.routes.draw do
  devise_for :users
  root to: "furias#index"
end
