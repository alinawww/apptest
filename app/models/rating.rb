class Rating < ApplicationRecord
  belongs_to :project
  validates_presence_of :project
  
end
