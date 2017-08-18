class QrCodePosition < ApplicationRecord
  has_many :documents
  belongs_to :user, counter_cache: true

  audited

  validates :name, :page, :x, :y, :size, presence: {notice: "aïe"}
end
