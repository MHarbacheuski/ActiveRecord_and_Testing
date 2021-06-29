class OrganizationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index

    @organizations = Organization.all
    #binding.pry
    #@organizations = Organization.where(id: 1)
    #binding.pry
    #@organizations = Organization.find_by(id: params[:organization_id])
    #@organizations = Organization.joins(:users).where(id: params[:organization_id])

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
