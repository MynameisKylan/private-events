class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save || User.find_by(name: @user.name)
      @user = User.find_by(name: @user.name)
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      flash.now[:notice] = 'Name cannot be blank'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
