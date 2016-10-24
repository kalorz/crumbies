class MediaComponent < ApplicationRecord
  has_one :story_part,
          as:        :component,
          dependent: :restrict_with_error

  has_many :media, -> { order(:position) },
           inverse_of: :media_component,
           dependent:  :destroy

end
