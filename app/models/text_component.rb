class TextComponent < ApplicationRecord
  belongs_to :text_story_part,
             inverse_of: :text_component

end
