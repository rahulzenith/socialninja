class PostsController < ApplicationController
before_action :authenticate_user!, only: [:home ,:create, :destroy]
before_action :set_post, only: [:destroy]
before_action :authorize_user, only: [:destroy]

def home
# for new posts
@post = Post.new

# for list of posts
@posts = Post.all

# for new comment
@comment = Comment.new

@all_users = User.all.order("id").pluck(:email)
@user_ids = User.all.order("id").pluck(:id)
end

def create

@post = Post.create(content: params[:post][:content], user_id: current_user.id)
@comment = Comment.new
# redirect_to action: "home"

end

def destroy

@post_id = @post.id
@post.destroy

# redirect_to action: "home"
end


private

def set_post
@post = Post.find(params[:id])
end

def authorize_user
if (@post.user_id != current_user.id)
redirect_to action: "home"
end

end


end











