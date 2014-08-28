class Pit < ActiveRecord::Base
  validates :topic, :author, :summary, presence: true
  acts_as_votable
  has_many :comments
  belongs_to :user
  mount_uploader :image, ImageUploader
end
