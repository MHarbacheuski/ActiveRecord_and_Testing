class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :find_item, only: %i[update]

  def index
    @organizations = Organization.find_by(id: params[:organization_id])
    @user = User.joins(:organization).where(organizations: @organizations)
    @post = Post.joins(:user).where(users: @user, organizations: @organizations)
    #binding.pry
  end

  def new
    @organizations = Organization.find_by(id: params[:organization_id])
    @user = User.new
  end

  def create
    #@user = User.find params[:user_id]
    @user = User.create(users_params)
    if @user.persisted?
      # render json: item.name, status:  :created
      if @user
        redirect_to organization_users_path
      end
    else
      #flash.now[:error] = 'Please fill all fields correctly'
      render :new
    end
  end

  def update
    if @user.state == 'active'
      @user.update(state: "inactive")
    else
      @user.update(state: "active")
    end
    redirect_back fallback_location: organization_user_path
  end

  def show
    @organization = Organization.find_by(id: params[:organization_id])
    @user = User.where(id: params[:id]).first
    @post = Post.joins(:user).where(users: @user, organizations: @organization)
  end

  private

  def find_item
    @user = User.where(id: params[:id]).first
    render_404 unless @user
  end

  def users_params
    params.permit(:name, :state, :organization_id)
  end

end
