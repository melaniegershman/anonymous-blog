class Tag < ActiveRecord::Base
  validates_presence_of :tag
  validates_uniqueness_of :tag

  has_many :entry_tags
  has_many :entries, through: :entry_tags
end
