class TextComponent < ApplicationRecord
  has_one :entry_section,
          as:        :component,
          dependent: :restrict_with_error

end
