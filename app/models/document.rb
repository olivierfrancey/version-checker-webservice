class Document < ApplicationRecord
  belongs_to :user,    counter_cache: true
  belongs_to :project, counter_cache: true
  belongs_to :group,   counter_cache: true

  has_many :versions, dependent: :destroy

end
