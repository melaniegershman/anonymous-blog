class Entry < ActiveRecord::Base
  # Remember to create a migration!
  validates_presence_of :body, :title
  validates_uniqueness_of :title

  has_many :entry_tags
  has_many :tags, through: :entry_tags
end
