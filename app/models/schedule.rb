class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :commmit
  has_many :plans,dependent: :destroy

  default_scope -> { order(start: :asc) }
  scope :completion, -> {where(end: :end < Time.current)}
  scope :pending, -> {where(start: nil, end_time: nil)}
  scope :imperfect, -> {where(start: :start >= Time.current)}

  validate :start_end_check
  validates :commit_id, presence: true
  validates :title, presence: true
	with_options presence: true, on: :create_schedule do
    validates :start
    validates :end
  end

   #時間の矛盾を防ぐ
   def start_end_check
     if self.start_time.present? && self.end_time.present?
       errors.add(:end, "が開始時刻を上回っています。正しく記入してください。") if self.start > self.end
     end
   end
end