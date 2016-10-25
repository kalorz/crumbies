class TextStoryPart < StoryPart
  has_one :text_component,
          foreign_key: :story_part_id,
          inverse_of:  :text_story_part,
          dependent:   :destroy

end
