class UsersController < ApplicationController
  def show
  # @user=current_user
    @user=User.find(params[:id])
    @book=@user.books
  end

  def index
    @users=User.all
    @user=current_user
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
    if @user==current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    user=User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
