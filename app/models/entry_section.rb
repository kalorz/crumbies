class EntrySection < ApplicationRecord
  belongs_to :story,
             inverse_of:    :sections,
             counter_cache: :sections_count

  belongs_to :component,
             dependent:   :destroy,
             polymorphic: true

end
