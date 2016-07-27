class User < ApplicationRecord
  acts_as_messageable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects

  scope :speakers, -> { where(type: 'Speaker') }
  scope :attendees, -> { where(type: 'Attendee') }
  self.inheritance_column = :type

  def self.types
        %w(Speaker Attendee)
  end
end
