class Story < ApplicationRecord
  belongs_to :journal,
             inverse_of:    :stories,
             counter_cache: true

  has_many :parts, -> { order(:position) },
           class_name: 'StoryPart',
           inverse_of: :story,
           dependent:  :destroy

end
