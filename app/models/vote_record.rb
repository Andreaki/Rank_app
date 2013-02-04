class VoteRecord < ActiveRecord::Base
  attr_accessible :ip_adress, :is_like, :name_id
  belongs_to :name

end

  
