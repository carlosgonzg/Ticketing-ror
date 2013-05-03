class Update < ActiveRecord::Base
    attr_accessible :UpdateText, :Date
    belongs_to :requests
end
