class UsersController < ApplicationController
  def show
    @posts = Post.where(user_id: params[:id]).order(id: "DESC")
  end
end
