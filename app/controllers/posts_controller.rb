class PostsController < ApplicationController
    before_action :require_login, only: :new
    skip_before_action :require_login, only: [:index, :show]
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
    end

    private

    def require_login
        unless user_signed_in?
            redirect_to posts_path, alert: "You need to be signed in to do this"
        end
    end
end
