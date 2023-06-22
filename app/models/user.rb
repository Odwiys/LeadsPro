class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :campaigns
  has_many :user_questions
  has_many :questions, through: :user_questions
  has_many :forms, through: :campaigns
  has_many :responses, through: :forms
  has_many :leads, through: :responses

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
  validates :cea_number, presence: true, uniqueness: true
  validates :password, presence: true
end
