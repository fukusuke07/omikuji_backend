class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: %i[show update]

    def index

      if current_api_v1_user
        render json: { status: 200, user: current_api_v1_user } , each_serializer: UserSerializer
      else
        render json: { status: 500, message: "ユーザーが存在しません" } , each_serializer: UserSerializer
      end

    end
  
    def show
      render json: { status: 200, user: @user }, serializer: UserSerializer
    end
  
    def update
      @user.name = user_params[:name]

      if @user.save
        render json: { status: 200, user: @user }, serializer: UserSerializer
      else
        render json: { status: 500, message: "更新に失敗しました" }, serializer: UserSerializer
      end
    end
  
    private
  
      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params
        params.permit(:name)
      end
  end