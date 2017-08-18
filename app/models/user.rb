class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, confirmation: true, on: :create
  validates :terms_of_service, acceptance: true, on: :create
  validates_length_of :password, in: 5..30, on: :create
  validates :check_password, confirmation: true, on: :update
  validates :first_name, :last_name, presence: {notice: "aïe"}

  has_many :projects,  dependent: :destroy
  has_many :groups,    dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :versions,  dependent: :destroy
  has_many :accesses,  dependent: :destroy
  has_many :qr_code_positions
  has_many :audits

  def check_password
    return unless password.present? || password_confirmation.present?
    # does not check the password length
  end
end
