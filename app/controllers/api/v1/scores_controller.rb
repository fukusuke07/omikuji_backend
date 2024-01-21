class Api::V1::ScoresController < ApplicationController
    before_action :set_score, only: %i[update]
    before_action :authenticate_api_v1_user!, only: %i[show, update]

    def show
      scores = Score.all
      today_scores = scores.created_today.order(total_score: "DESC")
      user_score = today_scores.where(user_id: current_api_v1_user.id)

      if user_score.blank? then
        render json:{ status: 204, message: "まだスコアがありません"}

      else
        
        ranking = today_scores.find_index { |score| score[:user_id] == current_api_v1_user.id } + 1

        render json:{ status: 200, score: user_score[0],scores:today_scores, ranking: ranking, population: today_scores.length, date: user_score[0].created_at.strftime('%Y/%m/%d')}

      end
      
    end
  
    def create
      score = Score.new(score_params)
      
      if score.save then
        scores = Score.all

        today_scores = scores.created_today.order(total_score: "DESC")

        ranking = today_scores.find_index { |score| score[:total_score] == score.total_score } + 1

        render json: { status: 200, score: score, ranking: ranking, population: today_scores.length, date: score.created_at.strftime('%Y/%m/%d') }
      else

        render json: { status: 500, score: "作成に失敗しました" }
      end
    end

    def update
      
  
      @score.user_id = score_params[:user_id]
      @score.total_score = score_params[:total_score]
      @score.competition_score = score_params[:competition_score]
      @score.love_score = score_params[:love_score]
      @score.money_score = score_params[:money_score]
      @score.draw_count = score_params[:draw_count]

      if @score.save then
        scores = Score.all
        
        today_scores = scores.created_today.order(total_score: "DESC")

        ranking = today_scores.find_index { |score| score[:total_score] == @score.total_score } + 1

        render json: { status: 200, score: @score, ranking: ranking, population: today_scores.length , date: @score.created_at.strftime('%Y/%m/%d')}
      else
        render json: { status: 500, score: @score, message: "更新に失敗しました" }
      end
    end
  
    private
      def set_score
        @score = Score.find(params[:id])
      end

      def score_params
        params.permit(:id, :user_id, :total_score, :draw_count, :competition_score, :love_score, :money_score)
      end

      def ranking(score)

        scores = Score.all
        today_scores = scores.created_today.order(total_score: "DESC")
        ranking = 1
        count = 0


        while count < today_scores.length do

          if count > 0 then
            if today_scores[count-1].total_score > today_scores[count].total_score then
              pp ranking
              ranking += 1
            end
          end
    
          if today_scores[count].total_score <= score.total_score then
  
            pp today_scores[count].id
            break
          end
  
          count += 1
        end

        @ranking = ranking

        @population = today_scores.length
      end
end