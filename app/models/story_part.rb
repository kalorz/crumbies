class StoryPart < ApplicationRecord
  belongs_to :story,
             inverse_of:    :parts,
             counter_cache: :parts_count

  belongs_to :component,
             dependent:   :destroy,
             polymorphic: true

end
