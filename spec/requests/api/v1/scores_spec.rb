require 'rails_helper'

RSpec.describe 'ScoresAPI', type: :request do
    describe 'fetchScoreAPI' do
        before do
            @user = create(:user)
            @token = sign_in(@user)
            @score = create(:score, user_id: @user.id)

        end
        context 'スコアを取得できる場合' do
            it 'user_idが正しく入力されており、認証用トークンが付与されている' do

                get "/api/v1/scores/#{@score.id}" , params: {}, headers: @token
                
                json = JSON.parse(response.body)
            
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)
                expect(json['score']['total_score']).to eq(@score.total_score)

            end
        end
        context 'スコアを取得できない場合' do
            it 'user_idが正しく入力されており、認証用トークンを付与していない' do
            
                get "/api/v1/scores/#{@score.id}" , params: {}
                
                json = JSON.parse(response.body)
            
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)
    
            end
        end
    end
    describe 'createScoreAPI' do
        before do
            @user = create(:user)
            @token = sign_in(@user)
            @score = create(:score, user_id: @user.id)
            @valid_params = {      
                total_score:  Faker::Number.between(from: 0, to: 300),
                competition_score:  Faker::Number.between(from: 0, to: 100),
                love_score:  Faker::Number.between(from: 0, to: 100),
                money_score:  Faker::Number.between(from: 0, to: 100),
                draw_count:  Faker::Number.between(from: 0, to: 100),
                user_id: @user.id
              }
        end
        context '新しいスコアを作成できる場合' do
            it 'total_score, competition_score, love_score, money_score, draw_count,user_idが正しく入力されており、認証用トークンも付いている' do

               post "/api/v1/scores/" , params: @valid_params, headers: @token
     
               json = JSON.parse(response.body)
            
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)
                expect(json['score']['total_score']).to eq(@valid_params[:total_score])
            end
            it 'total_score, competition_score, love_score, money_score, draw_count,user_idが正しく入力されているが、認証用トークンはついていない場合' do

               post "/api/v1/scores/" , params: @valid_params
     
               json = JSON.parse(response.body)
            
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)
                expect(json['score']['total_score']).to eq(@valid_params[:total_score])
            end
            it 'total_score, competition_score, love_score, money_score, draw_countが正しく入力されており、user_idが正しく入力されておらず、認証用トークンが付いている' do

                @valid_params[:user_id] = nil

                post "/api/v1/scores/" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)
                expect(json['score']['total_score']).to eq(@valid_params[:total_score])
             end
             it 'total_score, competition_score, love_score, money_score, draw_count正しく入力されており、user_idが正しく入力されておらず、認証用トークンが付いていない場合' do
 
                @valid_params[:user_id] = nil

                post "/api/v1/scores/" , params: @valid_params
      
                json = JSON.parse(response.body)
             
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)
                expect(json['score']['total_score']).to eq(@valid_params[:total_score])
             end
        end
        context '新しいスコアを作成できない場合' do
            it 'total_scoreが入力されていない' do

                @valid_params[:total_score] = nil

                post "/api/v1/scores/" , params: @valid_params, headers: @token
     
                json = JSON.parse(response.body)
            
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)
                
            end
            it 'total_scoreが0未満' do

                @valid_params[:total_score] = -1

                post "/api/v1/scores/" , params: @valid_params, headers: @token
     
                json = JSON.parse(response.body)
             
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)
                
            end
            it 'total_scoreが300より大きい' do

                @valid_params[:total_score] = 301

                post "/api/v1/scores/" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                 # リクエスト成功を表す200が返ってきたか確認する。
                 expect(json['status']).to eq(200)
                 
            end
            it 'competition_scoreが入力されていない' do

                @valid_params[:competition_score] = nil

                post "/api/v1/scores/" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                 # リクエスト成功を表す200が返ってきたか確認する。
                 expect(json['status']).to eq(200)
                 
            end
            it 'competition_scoreが0未満' do

                @valid_params[:competition_score] = -1
 
                post "/api/v1/scores/" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                 # リクエスト成功を表す200が返ってきたか確認する。
                 expect(json['status']).to eq(200)
                 
            end
            it 'competition_scoreが100より大きい' do

                @valid_params[:competition_score] = 101
 
                post "/api/v1/scores/" , params: @valid_params, headers: @token
       
                json = JSON.parse(response.body)
             
                 # リクエスト成功を表す200が返ってきたか確認する。
                 expect(json['status']).to eq(200)
            end
            it 'love_scoreが入力されていない' do

                @valid_params[:love_score] = nil

                post "/api/v1/scores/" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                 # リクエスト成功を表す200が返ってきたか確認する。
                 expect(json['status']).to eq(200)
            end
            it 'love_scoreが0未満' do

                @valid_params[:love_score] = -1
 
                post "/api/v1/scores/" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)

            end
            it 'love_scoreが100より大きい' do

                @valid_params[:competition_score] = 101
 
                post "/api/v1/scores/" , params: @valid_params, headers: @token
       
                json = JSON.parse(response.body)
              
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)

            end
            it 'money_scoreが0未満' do

                @valid_params[:money_score] = -1
 
                post "/api/v1/scores/" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)

            end
            it 'money_scoreが100より大きい' do

                @valid_params[:money_score] = 101
 
                post "/api/v1/scores/" , params: @valid_params, headers: @token
       
                json = JSON.parse(response.body)
              
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)

            end
            it 'draw_countが入力されていない' do

                @valid_params[:draw_count] = nil

                post "/api/v1/scores/" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)

            end
            it 'draw_countが0未満' do

                @valid_params[:draw_count] = -1
 
                post "/api/v1/scores/" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)

            end
        end
    end
    describe 'updateScoreAPI' do
        before do
            @user = create(:user)
            @token = sign_in(@user)
            @score = create(:score, user_id: @user.id)
            @valid_params = {      
                total_score:  Faker::Number.between(from: 0, to: 300),
                competition_score:  Faker::Number.between(from: 0, to: 100),
                love_score:  Faker::Number.between(from: 0, to: 100),
                money_score:  Faker::Number.between(from: 0, to: 100),
                draw_count:  Faker::Number.between(from: 0, to: 100),
                user_id: @user.id
              }
        end
        context 'スコアを更新できる場合' do
            it 'total_score, competition_score, love_score, money_score, draw_count,user_idが正しく入力されており、認証用トークンが付いている' do

                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                 # リクエスト成功を表す200が返ってきたか確認する。
                 expect(json['status']).to eq(200)
                 expect(json['score']['id']).to eq(@score.id)
            end
        end
        context 'スコアを更新でない場合' do
            it 'total_score, competition_score, love_score, money_score, draw_count,user_idが正しく入力されているが、認証用トークンが付いていない' do

                put "/api/v1/scores/#{@score.id}" , params: @valid_params
      
                json = JSON.parse(response.body)
             
                 # リクエスト成功を表す200が返ってきたか確認する。
                 expect(json['status']).to eq(200)
                 
            end
            it 'total_scoreが入力されていない' do

                @valid_params[:total_score] = nil

                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
     
                json = JSON.parse(response.body)
            
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)

            end
            it 'total_scoreが0未満' do

                @valid_params[:total_score] = -1

                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
     
                json = JSON.parse(response.body)
             
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)

            end
            it 'total_scoreが300より大きい' do

                @valid_params[:total_score] = 301

                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                 # リクエスト成功を表す200が返ってきたか確認する。
                 expect(json['status']).to eq(200)

            end
            it 'competition_scoreが入力されていない' do

                @valid_params[:competition_score] = nil

                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                 # リクエスト成功を表す200が返ってきたか確認する。
                 expect(json['status']).to eq(200)

            end
            it 'competition_scoreが0未満' do

                @valid_params[:competition_score] = -1
 
                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                 # リクエスト成功を表す200が返ってきたか確認する。
                 expect(json['status']).to eq(200)

            end
            it 'competition_scoreが100より大きい' do

                @valid_params[:competition_score] = 101
 
                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
       
                json = JSON.parse(response.body)
              
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)

            end
            it 'love_scoreが入力されていない' do

                @valid_params[:love_score] = nil

                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)

            end
            it 'love_scoreが0未満' do

                @valid_params[:love_score] = -1
 
                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)

            end
            it 'love_scoreが100より大きい' do

                @valid_params[:competition_score] = 101
 
                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
       
                json = JSON.parse(response.body)
              
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)

            end
            it 'money_scoreが0未満' do

                @valid_params[:money_score] = -1
 
                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                # リクエスト成功を表す200が返ってきたか確認する。
                expect(json['status']).to eq(200)

            end
            it 'money_scoreが100より大きい' do

                @valid_params[:money_score] = 101
 
                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
       
                json = JSON.parse(response.body)
              
                  # リクエスト成功を表す200が返ってきたか確認する。
                  expect(json['status']).to eq(200)

            end
            it 'draw_countが入力されていない' do

                @valid_params[:draw_count] = nil

                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                 # リクエスト成功を表す200が返ってきたか確認する。
                 expect(json['status']).to eq(200)

            end
            it 'draw_countが0未満' do

                @valid_params[:draw_count] = -1
 
                put "/api/v1/scores/#{@score.id}" , params: @valid_params, headers: @token
      
                json = JSON.parse(response.body)
             
                 # リクエスト成功を表す200が返ってきたか確認する。
                 expect(json['status']).to eq(200)

            end
        end
    end
end