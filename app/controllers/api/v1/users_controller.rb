module Api
    module V1
        class UsersController < ApplicationController

            protect_from_forgery with: :null_session

            def index
                users = User.all
                render json: UserSerializer.new(users).serialized_json
            end
            
            def show
                user = User.find(params[:id])
                render json: UserSerializer.new(user).serialized_json
            end

            def create
                user = User.new(user_params)

                if user.save
                    render json: UserSerializer.new(user).serialized_json
                else
                    render json: {error: user.errors.messages }, status: 422
                end
            end

            
            def update
                user = User.find(params[:id])

                if user.update(user_params)
                    render json: UserSerializer.new(user).serialized_json
                else
                    render json: {error: user.errors.messages }, status: 422
                end
            end

            
            def destroy
                user = User.find(params[:id])
                if user.destroy
                    head :no_content
                else
                    render json: {error: user.errors.messages }, status: 422
                end
            end

            private

            def user_params
                params.require(:user).permit(:name, :email, :age)
            end


        end
    end
end