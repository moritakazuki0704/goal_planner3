class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :ideal,dependent: :destroy
  has_many :problems,dependent: :destroy
  has_many :schedules,dependent: :destroy
  has_many :motivations,dependent: :destroy
  has_many :scrap_books,dependent: :destroy


  validates_uniqueness_of :secret_word
  validates_presence_of :secret_word

  validates :secret_word, presence: true, uniqueness: true
  validates :planner_name, presence: true
  # context: :create_mission_statementをsaveに引数として渡した場合のみバリデーションする
  with_options presence: true, on: :update do
    validates :mission_statement
    validates :mission_detail
  end


  # nameを利用してログイン
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["secret_word = :value", { :value => secret_word }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

 def will_save_change_to_email?
   false
 end

end
