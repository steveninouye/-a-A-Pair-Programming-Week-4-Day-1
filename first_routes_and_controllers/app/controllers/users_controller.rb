class UsersController < ApplicationController
  
  def index
    @users = User.all
    render json: @users
  end
  
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end
  
  def show
    user = User.find(params[:id])
    render json: user
  end
  
  def destroy
    find_user{|user| user.destroy}
  end
  
  def update
    find_user{|user| user.update(user_params)}
  end
  
  private
  def user_params
    params.require(:user).permit(:username)
  end
  
  def find_user(&prc)
    user = User.where(id: params[:id])
    user = user.first
    
    if user
      prc.call(user)
      render json: user
    else
      render json: 'User Not Found', status: 422
    end
  end
end