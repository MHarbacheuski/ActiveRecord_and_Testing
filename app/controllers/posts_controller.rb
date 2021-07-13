# frozen_string_literal: true
class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_post, only: %i[edit]
  before_action :find_organization, only: %i[new create]

  def index
    @posts = Post.all
    organization_id = params[:organization_id]
    @organizations = Organization.find_by(id: organization_id) if organization_id
    @posts = Post.post_to_organization(organization_id).build
    state = [:active]
    @users = User.user_state(organization_id, state)
  end

  def new
    @post = @organization.posts.build
  end

  def create
    @post = @organization.posts.build(posts_params)
    redirect_to organization_posts_path if @post.save
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to organization_posts_path
    else
      render body: 'Poka'
    end
  end

  def edit; end

  def show; end

  def destroy
    @organization = Organization.find_by(params[:organization_id])
    @user = User.find(params[:id])
    @post = Post.find_by(users: @user)
    if @post.destroy.destroyed?
      redirect_to organization_posts_path(@organization)
    else
      render json: item.errors, status: :unprocessable_entity
    end

  end

  private

  def find_post
    @organization = Organization.find_by(id: params[:organization_id])
    @user = User.find(params[:id])
    @post = Post.find_by(users: @user)
    render_404 unless @organization
  end

  def find_organization
    @organization = Organization.find_by(id: params[:organization_id])
    render_404 unless @organization
  end

  def posts_params
    params.require(:post).permit(:user_id, :organization_id, :text_post, :status)
  end

end
