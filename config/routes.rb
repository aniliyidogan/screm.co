Rails.application.routes.draw do
  root 'pages#home'

  get 'ping',                    to: 'application#ping'
  get 'about',                   to: 'pages#about',      as: :about

  get 'auth/:provider/callback', to: 'sessions#create_with_omniauth'
  post 'login',                  to: 'sessions#create',  as: :login
  delete 'out_poker',            to: 'sessions#destroy', as: :out_poker

  post 'cards/:card_id/choose',  to: 'cards#choose',     as: :choose_card

  get 'points',                  to: 'pages#points',     as: :points

  delete 'pokers/reset',         to: 'pokers#reset',     as: :reset_poker
  patch 'pokers/result',         to: 'pokers#result',    as: :result_poker

  mount ActionCable.server => '/cable'

  match '*path',                 to: redirect('/'), via: :all
end
