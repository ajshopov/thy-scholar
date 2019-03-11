class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:stripe_connect]
  has_many :questions

  scope :expert, -> { where.not(stripe_id: nil) }
  scope :customer, -> { where(stripe_id: nil) }

  def is_recipient_for
    Question.where(recipient_id: id).order(created_at: :desc)
  end

  def is_sender_for
    Question.where(sender_id: id).order(created_at: :desc)
  end
end
