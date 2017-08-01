class Group < ApplicationRecord
  belongs_to :user,    counter_cache: true
  belongs_to :project, counter_cache: true

  has_many :documents, dependent: :destroy
  has_many :versions,  dependent: :destroy
end
