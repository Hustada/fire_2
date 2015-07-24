class Joinable < ActiveRecord::Base
  belongs_to :pit
  belongs_to :user
  acts_as_taggable
end