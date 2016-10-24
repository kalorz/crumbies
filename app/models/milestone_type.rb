class MilestoneType < ApplicationRecord
  belongs_to :milestone_category,
             inverse_of:    :milestone_types,
             counter_cache: true

end
