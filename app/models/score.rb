class Score < ApplicationRecord
    scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日

    validates :total_score, {presence: true, numericality: {greater_than_or_equal_to: 0,less_than_or_equal_to: 300}}
    validates :competition_score, {presence: true, numericality: {greater_than_or_equal_to: 0,less_than_or_equal_to: 100}}
    validates :love_score, {presence: true, numericality: {greater_than_or_equal_to: 0,less_than_or_equal_to: 100}}
    validates :money_score, {presence: true, numericality: {greater_than_or_equal_to: 0,less_than_or_equal_to: 100}}
    validates :draw_count, {presence: true, numericality: {greater_than_or_equal_to: 0}}

    belongs_to :user, class_name: "User", foreign_key: :user_id, optional: true
end
