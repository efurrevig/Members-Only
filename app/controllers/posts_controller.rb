class PostsController < ApplicationController
    before_action :require_login, only: :new
    skip_before_action :require_login, only: [:index, :show]
    def index
        @posts = Post.all
    end

    def show
    
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end

    end

    private

        def require_login
            unless user_signed_in?
                redirect_to posts_path, alert: "You need to be signed in to do this"
            end
        end

        def post_params
            params.require(:post).permit(:title, :body)
        end
end
