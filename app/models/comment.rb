class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to :pit
  belongs_to :user
end
