class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :mission,dependent: :destroy
  has_one :ideal,dependent: :destroy
  has_one :motivation,dependent: :destroy
  has_many :schedules,dependent: :destroy
  has_many :scrap_books,dependent: :destroy


  validates_uniqueness_of :secret_word
  validates_presence_of :secret_word

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
