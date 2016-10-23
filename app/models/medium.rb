class Medium < ApplicationRecord
  belongs_to :media_component,
             inverse_of:    :media,
             counter_cache: true

end
