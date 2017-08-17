class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :firm

  belongs_to :user

  # Indirect associations

  # Validations

end
