class Name < ActiveRecord::Base
  attr_accessible :title
  has_many :vote_record
  validates :title, :uniqueness => {:case_sensitive => false}, presence: true, :length => {:maximum => 30}
  validates :title, :format => { :with => /^[a-z0-9\.]+$/i}
  
end

