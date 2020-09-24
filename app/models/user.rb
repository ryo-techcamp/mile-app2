class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, :password, presence: true

  validates :password, presence: true, length: { minimum: 6 },
                       format: { with: /\A[a-z0-9]+\z/i, message: 'is must NOT contain any other characters than alphanumerics.' }
  validates :first_kana, :family_kana, presence: true,
                                       format: { with: /\A([ァ-ン]|ー)+\z/, message: 'is must NOT contain any other characters than alphanumerics.' }
  validates :first_name, :family_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  has_many :sns_credentials
      end