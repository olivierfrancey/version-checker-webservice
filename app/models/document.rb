class Document < ApplicationRecord
  attr_accessor :position

  audited

  belongs_to :user,             counter_cache: true
  belongs_to :project,          counter_cache: true
  #belongs_to :group,            counter_cache: true
  belongs_to :qr_code_position, counter_cache: true

  has_many :versions, dependent: :destroy

  validates :title, :identifier, :position, presence: {notice: "aïe"}, on: :create

end
