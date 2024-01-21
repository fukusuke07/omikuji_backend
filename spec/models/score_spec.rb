require 'rails_helper'

RSpec.describe Score, type: :model do
  #ユーザーを新たに作成(登録)するテストなので#createとしています
  describe '#create' do
    # spec/factories/user.rbの内容を呼び出し変数にします
    # スコープが異なるのでローカル変数ではなく@をつけてインスタンス変数にします
    before do
      @user = create(:user)
      @score = build(
        :score,
        user_id: @user.id
        )
    end
    # contextには条件・状況を記述します
    context 'スコアが保存できる場合' do
      # itにはテストする項目を記述します
      it 'total_score, competition_score, love_score, money_score, draw_countが正しく入力されていれば新規登録できる' do
        # FactoryBotで作成したuser情報が正しければバリデーションにかからずbe_validでテストをパスします   
        expect(@score).to be_valid
      end

      it 'user_idがnilでも保存できる' do
        @score.user_id = nil
        expect(@score).to be_valid
    end
  end

    context 'スコア保存ができない場合' do
      # ユーザー名を入力しないで登録しようとした場合バリデーションにより登録できないことをテスト
      it 'total_scoreが空だと登録できない' do
        # userのnameを空に更新
        @score.total_score = nil
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@score.errors.full_messages).to include("Nameを入力してください")
      end

      it 'total_scoreが0未満だと登録できない' do
        # userのnameを空に更新
        @score.total_score = -1
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@score.errors.full_messages).to include("Nameを入力してください")
      end

      it 'total_scoreが300より大きいと登録できない' do
        # userのnameを空に更新
        @score.total_score = 301
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@user.errors.full_messages).to include("Nameを入力してください")
      end

      it 'competition_scoreが空だと登録できない' do
        # userのnameを空に更新
        @score.competition_score = nil
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@score.errors.full_messages).to include("Nameを入力してください")
      end

      it 'competition_scoreが0未満だと登録できない' do
        # userのnameを空に更新
        @score.competition_score = -1
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@score.errors.full_messages).to include("Nameを入力してください")
      end

      it 'competition_scoreが100より大きいと登録できない' do
        # userのnameを空に更新
        @score.competition_score = 101
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@score.errors.full_messages).to include("Nameを入力してください")
      end

      it 'love_scoreが空だと登録できない' do
        # userのnameを空に更新
        @score.love_score = nil
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@score.errors.full_messages).to include("Nameを入力してください")
      end

      it 'love_scoreが0未満だと登録できない' do
        # userのnameを空に更新
        @score.love_score = -1
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@score.errors.full_messages).to include("Nameを入力してください")
      end

      it 'love_scoreが100より大きいと登録できない' do
        # userのnameを空に更新
        @score.love_score = 101
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@score.errors.full_messages).to include("Nameを入力してください")
      end

      it 'money_scoreが空だと登録できない' do
        # userのnameを空に更新
        @score.money_score = nil
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@score.errors.full_messages).to include("Nameを入力してください")
      end

      it 'money_scoreが0未満だと登録できない' do
        # userのnameを空に更新
        @score.money_score = -1
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@score.errors.full_messages).to include("Nameを入力してください")
      end

      it 'money_scoreが100より大きいと登録できない' do
        # userのnameを空に更新
        @score.money_score = 101
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@score.errors.full_messages).to include("Nameを入力してください")
      end

      it 'draw_countが空だと登録できない' do
        # userのnameを空に更新
        @score.draw_count = nil
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@score.errors.full_messages).to include("Nameを入力してください")
      end

      it 'money_scoreが0未満だと登録できない' do
        # userのnameを空に更新
        @score.draw_count = -1
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @score.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@score.errors.full_messages).to include("Nameを入力してください")
      end
    end
  end
end
