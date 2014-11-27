class Pit < ActiveRecord::Base
  validates :topic, :author, :summary, presence: true
  acts_as_votable
  has_many :comments
  belongs_to :user
  mount_uploader :image, ImageUploader

  auto_html_for :summary do
    html_escape
    image
    youtube(:width => 400, :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format

  end
end
