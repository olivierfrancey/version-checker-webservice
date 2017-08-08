class QrCodePosition < ApplicationRecord
  has_one :document
  belongs_to :user, counter_cache: true
end
