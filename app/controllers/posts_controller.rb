# frozen_string_literal: true
class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @posts = Post.all
    @organizations = Organization.find_by(id: params[:organization_id])

    @posts = Post.includes(:organization).where(organizations: @organizations)

    @posts = Post.select(:status).distinct
    @users = User.joins(:posts, :organization).where(organizations: @organizations)
                 .where('status = 0 AND state = "active"')
    render layout: 'post'
  end

  def new
    @organization = Organization.find_by(id: params[:organization_id])
    @post = @organization.posts.build
  end

  def create
    organization = Organization.find_by(id: params[:organization_id])
    @post = organization.posts.new(posts_params)

    if @post.save
      redirect_to organization_posts_path
    end
  end

  def update
    # @organizations = Organization.find_by(id: params[:organization_id])
    # @user = User.joins(:organization).where(organizations: @organizations)
    # #@post = Post.joins(:user).where(organization: @organizations).where(status: params[:status])
    # @posts = Post.includes(:user, :organization).where(users: @user, organizations: @organizations)
    # #binding.pry
    # @posts.update(posts_params)
    # #binding.pry
    # redirect_back fallback_location: organization_post_path
  end

  def show
    #binding.pry
  end

  private

  def posts_params
    params.require(:post).permit(:user_id, :organization_id, :text_post, :status)
  end

end
