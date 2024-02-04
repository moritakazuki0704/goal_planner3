class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :commmit
  has_many :plans,dependent: :destroy

  default_scope -> { order(start_time: :asc) }

  validates :start_end_check
  validates :title, presence: true
	with_options presence: true, on: :create_schedule do
    validates :start_time
    validates :end_time
  end

  scope :completion, -> {where(end_time: :end_time < Time.current)}
  scope :pending, -> {where(start_time: nil, end_time: nil)}
  scope :imperfect, -> {where(start_time: :start_time >= Time.current)}

  #時間の矛盾を防ぐ
  def start_end_check
    if self.start_time.present? && self.end_time.present?
      errors.add(:end_time, "が開始時刻を上回っています。正しく記入してください。") if self.start_time > self.end_time
    end
  end
end