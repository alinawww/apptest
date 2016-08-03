class Rating < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates_presence_of :project

end
