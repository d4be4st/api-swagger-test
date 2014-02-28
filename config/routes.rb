ApiSwagger::Application.routes.draw do

  mount API::Root_v1 => '/'
  get 'api/:version/docs' => 'api#docs', version: /[A-Za-z0-9\.]+?/
end
