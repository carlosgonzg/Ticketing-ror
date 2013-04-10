class Request < ActiveRecord::Base
  attr_accessible :ComputerName, :Description, :IssueType, :Subject, :urgent
end
