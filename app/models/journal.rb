class Journal < ApplicationRecord
  has_many :entries,
           inverse_of: :journal,
           dependent:  :destroy

end
