class UsersController < ApplicationController
  # before a specific controller action is run, run the specified
  # callback before the specific controller action. In this case we will run the set_user callback function only for the
  # specified actions. ie, index, update and destroy since they're the only functions that need the users id.
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: JsonApiResponse.render(
      data: @users,
      status: 200
    )
  end

  # GET /users/1
  def show
    render json: JsonApiResponse.render(
      data: @user,
      status: 200
    )
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: JsonApiResponse.render(
        data: @user,
        status: 201
      )
    else
      render json: JsonApiResponse.render(
        success: false,
        errors: @user.errors,
        status: 422,
      )
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: JsonApiResponse.render(
        data: @user,
        status: 200,
      )
    else
      render json: JsonApiResponse.render(
        success: false,
        errors: @user.errors,
        status: 422,
      )
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit([ :name, :email, :password, :password_confirmation ])
    end
end
