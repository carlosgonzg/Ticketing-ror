class Request < ActiveRecord::Base
  attr_accessible :ComputerName, :Description, :IssueType, :Subject, :urgent, :Solution, :Status, :userName
  has_many :updates
end
