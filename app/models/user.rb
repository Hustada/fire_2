class User < ActiveRecord::Base
  acts_as_voter
  has_many :joinables, :dependent => :destroy
  has_many :pits, :through => :joinables
  has_many :comments
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  devise :confirmable

  def set_default_role
    self.role ||= :user
  end

  def name
    name = first_name + ' ' + last_name
  end

  def firstname
    firstname = first_name
  end

  


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
