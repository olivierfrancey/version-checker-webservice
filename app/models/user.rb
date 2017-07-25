class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email, :case_sensitive => false

  has_many :projects, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :versions, dependent: :destroy
  has_many :accesses, dependent: :destroy
end
