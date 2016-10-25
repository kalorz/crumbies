class StoryPart < ApplicationRecord
  belongs_to :story,
             inverse_of:    :parts,
             counter_cache: :parts_count

end
