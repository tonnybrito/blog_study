class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    redirect_to new_user_path
  end

  def show
    @id = params[:id]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: "Usuario foi criado com sucesso"
    else
      render action: :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:nome, :email, :password, :password_confirmation)

  end
end
