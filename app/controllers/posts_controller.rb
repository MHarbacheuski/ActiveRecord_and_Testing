class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @posts = Post.all
    @organizations = Organization.find_by(id: params[:organization_id])

    @post = Post.where(status: [:active], organization_id: @organizations)

    @user = User.joins(:posts, :organization).where(organizations: @organizations)
                .where('status = 0 AND state = "active"')
    #@posts = Post.joins(:users).where(users: @users, organizations: @organizations)
    #binding.pry
    render layout: 'post'
  end

  def new

    @organizations = Organization.find_by(id: params[:organization_id])
    @user = User.joins(:organization).where(organizations: @organizations)
    @post = Post.joins(:user).where(users: @user, organizations: @organizations)
    #binding.pry
    @post = Post.new
  end

  def create
    @post = Post.create(posts_params)
    if @post.persisted?
      # render json: item.name, status:  :created
      if @post
        redirect_to organization_posts_path
      end
    else
      #flash.now[:error] = 'Please fill all fields correctly'
      render :new
    end
  end

  def update

  end

  def show
    #binding.pry
  end

  private

  def posts_params
    params.permit(:organization_id, :user_id, :text_post, :status)
  end

end
