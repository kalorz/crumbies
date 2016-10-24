class Journal < ApplicationRecord
  has_many :stories,
           inverse_of: :journal,
           dependent:  :destroy

end
