class EntryTag < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :entry
  belongs_to :tag
  validates :entry, :tag, presence: true
  validates :entry_id, uniqueness: {scope: :tag}
end
