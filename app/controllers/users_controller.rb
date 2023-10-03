class UsersController < ApplicationController

    def create
        user = User.new(user_params)
        
        if user.save
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: ["Unprocessable Entity"] }, status: :unprocessable_entity
        end
    end

    def index
        @users = User.all
        render json: @users
      end
    
    def show
        @user = User.find(params[:id])
        render json: @user
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
    

end
