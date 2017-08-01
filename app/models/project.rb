class Project < ApplicationRecord
  belongs_to :user, counter_cache: true
  
  has_many :groups,    dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :versions,  dependent: :destroy
  has_many :accesses,  dependent: :destroy
  
  validates :name, :identifier, presence: {notice: "aïe"}
end
