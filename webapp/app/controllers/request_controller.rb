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
		request.urgent = (params[:urgent] == "on")? "t":"f"
		request.IssueType = params[:IssueType]
        request.userName = session[:User][:Username]
		request.ComputerName = params[:ComputerName]
		request.Subject = params[:Subject]
		request.Description = params[:Description]
		request.complete = false
	
		if(request.save) then
			  flash[:notice] = "The Request was successfully created."
            UserMailer.new_request(session[:User],request).deliver
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
      @users = User.find(:all, :conditions=>"UserType == 0 OR UserType == 1")
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
		elsif(params[:SelectCategory] == "3")
			if(params[:val] == 'true')
				@result = Request.find_all_by_complete(true)
			elsif(params[:val] == 'false')
				@result = Request.find_all_by_complete(false)
			else
				@request = nil;
			end	
                elsif(params[:SelectCategory] == "4")
			if(params[:val] == 'true')
				@result = Request.find_all_by_urgent(true)
			elsif(params[:val] == 'false')
				@result = Request.find_all_by_urgent(false)
			else
				@request = nil;
			end
		elsif(params[:SelectCategory] == "5")
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
        if session[:User][:UserType] == 2 then
            redirect_to new_request_path
        end
        requests_total = Request.count(:all)
        @completed_requests = Request.count(:all,:conditions=>"complete='t'")
        @not_completed_requests = requests_total - @completed_requests
        @requests_by_hardware = Request.count(:all,:conditions=>"IssueType=1")
        @requests_by_software = Request.count(:all,:conditions=>"IssueType=2")
        @requests_by_network = Request.count(:all,:conditions=>"IssueType=3")
        @requests_by_login = Request.count(:all,:conditions=>"IssueType=4")
        @requests_by_peripheral = Request.count(:all,:conditions=>"IssueType=5")
        @not_urgent = Request.count(:all,:conditions=>"urgent='f'")
        @urgent = Request.count(:all,:conditions=>"urgent='t'")
        @requests = Request.find(:all,:conditions=>"owner='#{session[:User][:Username]}'")
    end
end
