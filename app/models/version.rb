class Version < ApplicationRecord
  belongs_to :user,     counter_cache: true
  belongs_to :project,  counter_cache: true
  belongs_to :group,    counter_cache: true
  belongs_to :document, counter_cache: true
  
  validates_uniqueness_of :project_id, :scope => :version_number
end
