module Api
    module V1
        class PostsController < ApplicationController
            def index
                posts = Post.all
                render json: serializer(posts)
            end
            
            def show
                post = Post.find(params[:id])
                render json: serializer(post)
            end

            def create
                post = Post.new(post_params)

                if post.save
                render json: serializer(post)
                else
                render json: errors(post), status: 422
                end
            end

            
            def update
                post = Post.find(params[:id])

                if post.update(post_params)
                render json: serializer(post)
                else
                render json: errors(post), status: 422
                end
            end

            
            def destroy
                if post.destroy
                head :no_content
                else
                render json: errors(post), status: 422
                end
            end

            private

            def post_params
                params.require(:post).permit(:title, :desc)
            end
            
        end
    end
end