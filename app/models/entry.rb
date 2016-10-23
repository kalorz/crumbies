class Entry < ApplicationRecord
  belongs_to :journal,
             inverse_of:    :entries,
             counter_cache: true

  has_many :sections, -> { order(:position) },
           class_name: 'EntrySection',
           dependent:  :destroy

end