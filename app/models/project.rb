class Project < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  # validates :user_id, presence: true
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" },
                    content_type: ['image/jpeg','image/jpg', 'image/png'],
                    default_url: "http://placehold.it/200x300",
                    whiny: false,
                    use_timestamp: false
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
