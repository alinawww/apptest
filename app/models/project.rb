class Project < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "https://source.unsplash.com/random"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :user_id, presence: true
end
