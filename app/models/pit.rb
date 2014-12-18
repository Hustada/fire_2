class Pit < ActiveRecord::Base
  validates :topic, :author, :summary, presence: true
  acts_as_taggable
  acts_as_votable
  has_many :comments
  # has_many :joinables
  belongs_to :user
  mount_uploader :image, ImageUploader

  auto_html_for :summary do
    html_escape
    image
    youtube(:width => 400, :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format

  end

  @@video_regexp = [ /^(?:https?:\/\/)?(?:www\.)?youtube\.com(?:\/v\/|\/watch\?v=)([A-Za-z0-9_-]{11})/, 
                   /^(?:https?:\/\/)?(?:www\.)?youtu\.be\/([A-Za-z0-9_-]{11})/,
                   /^(?:https?:\/\/)?(?:www\.)?youtube\.com\/user\/[^\/]+\/?#(?:[^\/]+\/){1,4}([A-Za-z0-9_-]{11})/
                   ]


def video_id
  @@video_regexp.each { |m| return m.match(video_url)[1] unless m.nil? }
end



end
