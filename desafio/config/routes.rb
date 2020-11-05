Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'welcome#index'
  
  scope 'writers' do
    get '/', to: 'writers#index', as: :writers
    post '/', to: 'writers#create'
    get '/new', to: 'writers#new', as: :new_writer
    get '/:id/edit', to: 'writers#edit', as: :edit_writer
    get '/:id', to: 'writers#show', as: :writer
    patch '/:id', to: 'writers#update'
    delete '/:id', to: 'writers#destroy'
  end

  scope 'books' do
    get '/', to: 'books#index', as: :books
    post '/', to: 'books#create'
    get '/new', to: 'books#new', as: :new_book
    get '/:id/edit', to: 'books#edit', as: :edit_book
    get '/:id', to: 'books#show', as: :book
    patch '/:id', to: 'books#update'
    delete '/:id', to: 'books#destroy'
  end
end
