class UsersController < ApplicationController
  def show
    @posts = Post.where(user_id: params[:id]).order(updated_at: "DESC")
  end
end
