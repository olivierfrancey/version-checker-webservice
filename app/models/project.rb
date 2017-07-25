class Project < ApplicationRecord
  belongs_to :user, counter_cache: true
  
  has_many :versions, through: :documents
  has_many :documents

  validates :name, :identifier, presence: {notice: "aïe"}
end
