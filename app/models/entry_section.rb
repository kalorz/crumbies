class EntrySection < ApplicationRecord
  belongs_to :entry,
             inverse_of:    :sections,
             counter_cache: :sections_count

end
