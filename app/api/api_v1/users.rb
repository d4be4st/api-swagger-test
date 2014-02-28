module API_v1

  class UserEntity < Grape::Entity
    expose :email
    expose :username
  end

  class Users < Grape::API

    desc 'Get all users'
    get :users do
      users = User.all
      present users, with: API_v1::UserEntity
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
