class Update < ActiveRecord::Base
  attr_accessible :Date, :UpdateText
  belongs_to :request
end
