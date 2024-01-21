class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController 
    def index
      if current_api_v1_user
        render json: { status: 200, current_user: current_api_v1_user } , each_serializer: UserSerializer
      else
        render json: { status: 500, message: "ユーザーが存在しません" }
      end
    end

    def render_create_success 
      render json: { status:200, user:@resource }, each_serializer: UserSerializer
     end 
   
  end
