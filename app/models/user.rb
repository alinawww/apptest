class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :favorite_projects
  has_many :rated_projects
  has_many :favorites, through: :favorite_projects, source: :project
  has_many :ratings, through: :rated_projects, source: :project

  scope :speakers, -> { where(type: 'Speaker') }
  scope :attendees, -> { where(type: 'Attendee') }
  acts_as_messageable



  self.inheritance_column = :type

  def mailboxer_email(object)
    email
  end

  def self.types
        %w(Speaker Attendee)
  end


end
