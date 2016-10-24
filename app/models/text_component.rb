class TextComponent < ApplicationRecord
  has_one :story_part,
          as:        :component,
          dependent: :restrict_with_error

end
