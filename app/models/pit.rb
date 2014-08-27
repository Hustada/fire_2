class Pit < ActiveRecord::Base
  acts_as_votable
  has_many :comments
  belongs_to :user
  mount_uploader :image, ImageUploader
end
