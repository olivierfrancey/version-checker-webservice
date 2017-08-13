class Version < ApplicationRecord
  belongs_to :user,     counter_cache: true
  belongs_to :project,  counter_cache: true
  belongs_to :document, counter_cache: true
  
  validates_uniqueness_of :version_number, :scope => [:project_id, :document_id]
  validates :version_number, :file, presence: {notice: "aïe"}

  mount_uploader :file, FileUploader
  mount_uploader :qrcode, QrcodeUploader
end
