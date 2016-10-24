class Story < ApplicationRecord
  belongs_to :journal,
             inverse_of:    :stories,
             counter_cache: true

  has_many :sections, -> { order(:position) },
           class_name: 'EntrySection',
           inverse_of: :story,
           dependent:  :destroy

end
