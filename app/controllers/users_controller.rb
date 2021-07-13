require 'will_paginate/array'
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_user, only: %i[update edit]
  before_action :find_organization, only: %i[new create]

  def index
    @users = User.all.paginate(page: params[:page], per_page: 20)
    @organizations = Organization.find_by(id: params[:organization_id])
    @users = User.joins(:organization).where(organizations: @organizations)
    @post = Post.joins(:user).where(users: @user, organizations: @organizations)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(users_params)
    if @user.persisted?
      redirect_to organization_users_path if @user
    else
      flash.now[:error] = 'Please fill all fields correctly'
      render :new
    end
  end

  def edit; end

  def pap
    @user = User.first
  end

  def update
    if @user.state == 'active'
      @user.update(state: 'inactive')
    else
      @user.update(state: 'active')
    end
    redirect_back fallback_location: organization_user_path
  end

  def show
    @organization = Organization.find_by(id: params[:organization_id])
    @user = User.where(id: params[:id]).first
    @post = Post.joins(:user).where(users: @user, organizations: @organization)
  end

  private

  def find_user
    @user = User.where(id: params[:id]).first
    render_404 unless @user
  end

  def find_organization
    @organizations = Organization.find_by(id: params[:organization_id])
  end

  def users_params
    params.permit(:name, :state, :organization_id)
  end

end
