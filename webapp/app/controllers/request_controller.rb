require 'date'   

class RequestController < ApplicationController
    def index
        @requests = Request.find(:all)
    end

    def show
	@requests = Request.find(:all)  
    end

 #New Request method
    def create
    if(params[:Subject].blank? || params[:Description].blank?) then
		flash[:error] = "Information not completed. Please complete the information"
	else
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
	end
	redirect_to request_index_path
    end
  
    def new
    end

    def edit
      id = params[:id]
      @request = Request.find(id)
      @updates = @request.updates
    end

    def update
      new_update = params[:UpdateText]
      @request = Request.find(params[:id])
      @request.updates.create(:UpdateText=>new_update, :Date=>DateTime.now.to_s)
      redirect_to request_index_path
    end

    def search
	if(!params[:val].blank?)		
		if(params[:SelectCategory] == "1")			
			@result = Request.find(params[:val])
		elsif(params[:SelectCategory] == "2")
			@result = Request.find_all_by_ComputerName(params[:val])
		elsif(params[:SelectCategory] == "3")
			@result = Request.find_all_by_Status(params[:val])
		elsif(params[:SelectCategory] == "4")
			@result = Request.find(:all)
		end
		
		if(@result.kind_of?(Array))
			@requests = @result 
		else
			@requests = Array.new(1, @result)
		end
	else	
		@requests = Request.find(:all)  	    
    	end
    end
    

    def destroy
    end

    def dashboard
    end
end
