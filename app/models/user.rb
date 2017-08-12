class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email, :case_sensitive => false

  validates :password, confirmation: true,  on: :new
  validates_length_of :password, in: 5..30, on: :new
  validate :check_password, on: :edit

  validates :first_name, :last_name, presence: {notice: "aïe"}

  has_many :projects,  dependent: :destroy
  has_many :groups,    dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :versions,  dependent: :destroy
  has_many :accesses,  dependent: :destroy
  has_many :qr_code_positions

  private

  def check_password
    return unless password.present? || password_confirmation.present?
  end
end
