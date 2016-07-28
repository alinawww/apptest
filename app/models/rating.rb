class Rating < ApplicationRecord
  belongs_to :project
  validates_presence_of :project
  # svalidates_inclusion_of :value, :in => 1..10
end
