Rails.application.routes.draw do
  devise_for :users
  # resources :products
  # root to: 'products#index'
  
  root to: 'items#index'
  get '/index' => 'items#index'

  # 해당 상품 카테고리로 이동
  get 'categories/:id' => 'categories#categorized_index'
  get '/hot_deal' => 'categories#hot_deal'


   # 상품 등록
  get '/new' => 'items#item_create'
  get '/new/:id' => 'items#item_create'
  post '/create' => 'items#create'

  # 제품 상세
  get '/detail/:id' => 'items#detail'


end
