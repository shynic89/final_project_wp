class User < ApplicationRecord
  # Direct associations

  has_many   :visits,
             :class_name => "Bookmark",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def email_required?
    false
  end

  def email_changed?
    false
  end
  
end
