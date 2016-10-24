class MilestoneCategory < ApplicationRecord
  has_many :milestone_types, -> { order(:position) },
           inverse_of: :milestone_category,
           dependent:  :destroy

end
