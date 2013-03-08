class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :reservations, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
