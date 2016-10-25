class MilestoneCategory < ApplicationRecord
  has_many :samples, -> { order(:position) },
           class_name:  'MilestoneSample',
           foreign_key: :category_id,
           inverse_of:  :category,
           dependent:   :destroy

end
