class Document < ApplicationRecord
  attr_accessor :position

  belongs_to :user,    counter_cache: true
  belongs_to :project, counter_cache: true
  #belongs_to :group,   counter_cache: true
  belongs_to :qr_code_position

  has_many :versions, dependent: :destroy

end
