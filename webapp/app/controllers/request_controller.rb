class RequestController < ApplicationController
    def index
        @requests = Request.find(:all)
    end

    def show
    end

 #New Request method
    def create
    	request = Request.new
	request.urgent = params[:urgent]
	request.IssueType = params[:IssueType]
	request.ComputerName = params[:ComputerName]
	request.Subject = params[:Subject]
	request.Description = params[:Description]
        request.Status = "Open"

	if(request.save) then
    	  flash[:notice] = "The Request was successfully created."
        else
          flash[:error] = "There was an error saving the new request"
        end
	redirect_to request_index_path
    end
  
    def new
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
