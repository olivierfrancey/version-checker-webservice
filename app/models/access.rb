class Access < ApplicationRecord
  attr_accessor :email

  audited
  
  belongs_to :user,    counter_cache: true
  belongs_to :project, counter_cache: true
end
