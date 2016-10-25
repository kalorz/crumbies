class MilestoneSample < ApplicationRecord
  belongs_to :category,
             class_name:    'MilestoneCategory',
             inverse_of:    :samples,
             counter_cache: :samples_count

end
