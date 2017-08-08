class QrCodePosition < ApplicationRecord
  has_one :document
  belongs_to :user, counter_cache: true

  validates :name, :page, :x, :y, :size, presence: {notice: "aïe"}
end
