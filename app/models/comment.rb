class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to :pit
  belongs_to :user
  validates :body, presence: true

  auto_html_for :body do
    html_escape
    image
    youtube(:width => 400, :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

 


end
