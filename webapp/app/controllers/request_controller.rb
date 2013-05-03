require 'date'   

class RequestController < ApplicationController
    def index
        redirect_to dashboard_request_index_path
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
		#request.userName = 
	
		if(request.save) then
			  flash[:notice] = "The Request was successfully created."
              UserMailer.new_request(session[:User][0],request).deliver
		    else
		      flash[:error] = "There was an error saving the new request"
		    end
	end
	redirect_to new_request_path
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
			if((params[:val].to_i))			
				@result = Request.find_by_id(params[:val].to_i)
			else
				flash[:error] = "No record present. Check the search value and try again"
				@requests = Request.find(:all)
			end
		elsif(params[:SelectCategory] == "2")
			@result = Request.find(:all, :conditions => ["userName LIKE ?", %(%#{params[:val]}%)])
			@result = Request.find(params[:val])
		elsif(params[:SelectCategory] == "2")
			@result = Request.find_all_by_ComputerName(params[:val])
		elsif(params[:SelectCategory] == "3")
			@result = Request.find_all_by_Status(params[:val])
		elsif(params[:SelectCategory] == "4")
			@result = Request.find(:all)
		end
		if(@result.nil?)
		      flash[:error] = "No record present. Check the search value and try again"
		      @requests = Request.find(:all) 
		elsif(@result.kind_of?(Array))
			if(@result.size == 0)
				flash[:error] = "No record present. Check the search value and try again"
		      		@requests = Request.find(:all) 
			else
				@requests = @result
			end
		if(@result.kind_of?(Array))
			@requests = @result 
		elsif(@result.nil?)
		      flash[:error] = "No record present. Check the search value and try again"
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
