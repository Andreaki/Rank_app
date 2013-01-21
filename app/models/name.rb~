class Name < ActiveRecord::Base
  attr_accessible :title
 
  validates :title, uniqueness: true, presence: true, :length => {:maximum => 30}
  validates :title, :format => { :with => /^((?!http|https):\/\/)?[a-z0-9]+([-.]{1}[a-z0-9]+).[a-z]{2,5}(:[0-9]{1,5})?(\/.)?$/ }
end
