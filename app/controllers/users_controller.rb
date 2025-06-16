class UsersController < ApplicationController

  def index
    @users = User.all
    @users = @users.by_company(params[:company_id]) if params[:company_id].present?
    @users = @users.by_username(params[:username]) if params[:username].present?
    render json: @users
  end

  private

end
