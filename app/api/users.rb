module Users

  class Entity < Grape::Entity
    expose :email
    expose :username
  end

  class API < Grape::API

    desc 'Get all users', {
      :object_fields => Users::Entity.documentation
    }
    get :users do
      users = User.all
      present users, with: Users::Entity
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