class OrganizationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @organizations = Organization.all.paginate(page: params[:page], per_page: 20)
  end

  def create; end

  def new
    @organization = Organization.new
  end

  def show
    @organization = Organization.where(id: params[:id]).first
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def items_params
    params.permit(:name)
  end

end
