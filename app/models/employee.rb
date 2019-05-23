class Employee < ApplicationRecord
  belongs_to :dog
  validates :alias, uniqueness: true
  validates :title, uniqueness: true


  def to_s
    "#{self.first_name} #{self.last_name}"
  end
end
