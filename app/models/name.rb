class Name < ActiveRecord::Base
  attr_accessible :title
 
  validates :title, uniqueness: true, presence: true, :length => {:maximum => 30}
  validates :title, :format => { :with => /^(?!http|https|www)([a-z0-9]+)$/ }
end
