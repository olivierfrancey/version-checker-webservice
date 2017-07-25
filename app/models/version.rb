class Version < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :document, counter_cache: true
end
