## Relevant repositories

* [grape](https://github.com/intridea/grape)
* [swagger-ui](https://github.com/wordnik/swagger-ui)
* [grape-entity](https://github.com/intridea/grape-entity)
* [grape-swagger](https://github.com/tim-vandecasteele/grape-swagger)
* [swagger-ui_rails](https://github.com/d4be4st/swagger-ui_rails)

## Preparing application

Add to your Gemfile:

    gem 'grape'
    gem 'grape-entity'
    gem 'grape-swagger'
    gem 'swagger-ui_rails'

## Adding swagger-ui

add to application.css and application.js

    require swagger-ui

create a api_docs view with:

    = render 'swagger_ui/swagger_ui', discovery_url: '/path/to/swagger_doc'

add route to routes.rb

    get 'api/docs' => 'api_docs#index'

## Create Grape API

please read [grape documentation](https://github.com/intridea/grape)

### Example

    module Users

      class API < Grape::API

        desc 'Get all users'
        get :users do
          users = User.all
        end

        desc 'Get one user'
        get 'users/:id' do
          User.find(params[:id])
        end

        desc 'Create user'
        params do
          group :user do
            requires :username, type: String
            requires :email, type: String
            optional :password, type: String
          end
        end
        post :user do
          User.create(params[:user])
        end
      end

    end

## Create Grape Swagger Documenatation

please read [grape-swagger documentation](https://github.com/tim-vandecasteele/grape-swagger)

### Example

    module API

      class Root < Grape::API

        prefix 'api'
        version 'v1'
        format :json

        mount Users::API
        add_swagger_documentation api_version: 'v1', hide_documentation_path: true, hide_format: true
      end

    end

## Add Api to Routes

    mount API::Root => '/'

Because of the prefix and the version, api urls are:

    GET /api/v1/swagger_doc
    GET /api/v1/users
    GET /api/v1/users/:id
    POST /api/v1/user

## RESTful Model Representations

Use [grape-entities](https://github.com/intridea/grape#restful-model-representations)

### Example

    module Users

      class Entity < Grape::Entity
        expose :email
        expose :username
      end

      class API < Grape::API

        desc 'Get all users'
        get :users do
          users = User.all
          present users, with: Users::Entity
        end
      end
    end

## Try it!

1. Clone this repository
2. run bundle
3. start server
4. open localhost:3000/api/docs
