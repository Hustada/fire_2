class Joinable < ActiveRecord::Base
  belongs_to :pit
  belongs_to :user
end