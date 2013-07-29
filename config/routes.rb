ApiSwagger::Application.routes.draw do

  mount API::Root => '/'
  get 'api/docs' => 'api_docs#index'
end
