class Employee < ApplicationRecord
  belongs_to :dog

  validates :alias, uniqueness: true
  validates :title, uniqueness: true

  def to_s
    first_name + ' ' + last_name
  end


end
