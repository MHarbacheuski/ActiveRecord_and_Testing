# frozen_string_literal: true
class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_post, only: %i[edit update]

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
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to organization_posts_path
    else
      render body: 'Poka'
    end
  end

  def edit
    @organization = Organization.find_by(id: params[:organization_id])
    @post = Post.find_by(params[:id])
  end

  def show; end

  def destroy
    @organization = Organization.find_by(id: params[:organization_id])
    @post = Post.find_by(params[:id])
  end

  private

  def find_post
    @organization = Organization.where(id: params[:organization_id])
    render_404 unless @organization
  end

  def posts_params
    params.require(:post).permit(:user_id, :organization_id, :text_post, :status)
  end

end
