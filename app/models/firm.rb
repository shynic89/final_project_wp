class Firm < ApplicationRecord
  # Direct associations

  has_many   :visits,
             :class_name => "Bookmark",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
