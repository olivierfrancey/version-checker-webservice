class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, confirmation: true
  validates_length_of :password, in: 5..30
  validates :first_name, :last_name, presence: {notice: "aïe"}

  has_many :projects,  dependent: :destroy
  has_many :groups,    dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :versions,  dependent: :destroy
  has_many :accesses,  dependent: :destroy
  has_many :qr_code_positions
end
